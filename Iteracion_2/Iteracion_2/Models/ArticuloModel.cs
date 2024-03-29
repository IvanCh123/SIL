﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Iteracion_2.Models
{
    public class ArticuloModel
    {
        private SqlConnection con;
        private ConexionModel ConnectionString { get; set; }

        public void Connection()
        {
            ConnectionString = new ConexionModel();
            con = ConnectionString.Connection();
        }

        public List<String> RecuperarNombresUsuarioNucleo() {

            Connection();
            List<string> Results = new List<string>();
            string query = "SELECT nombreUsuarioPk FROM Miembro WHERE pesoMiembro = 5 AND tipo = 'nucleo'";
            SqlCommand command = new SqlCommand(query, con)
            {
                CommandType = CommandType.Text
            };
            using (SqlDataReader reader = command.ExecuteReader()) {
                while (reader.Read()) {
                    Results.Add(reader["nombreUsuarioPk"].ToString());
                }

            }
            con.Close();
            return Results;
        }

        internal List<List<string>> RetornarArticulos()
        {
            DataTable dTable = new DataTable();

            Connection();

            string query = "SELECT A.artIdPK, A.titulo, A.resumen, M.nombre +' '+M.apellido AS [Autor], M.nombreUsuarioPK FROM Articulo A JOIN Miembro_Articulo MA ON A.artIdPK = MA.artIdFK JOIN Miembro M ON MA.nombreUsuarioFK = M.nombreUsuarioPK ORDER BY A.titulo";

            SqlCommand command = new SqlCommand(query, con)
            {
                CommandType = CommandType.Text
            };

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dTable);

            return LlenarArticulos(dTable, "todos");
        }
        public List<List<string>> validarRetornoArticulos()
        {
            return RetornarArticulos();
        }
        public List<string> RetornarTopicos(string artId)
        {
            List<string> topicos = new List<string>();
            string queryString = "Select T.nombre FROM Topico T JOIN Art_Topico AR ON T.topicoIdPK = AR.topicoIdFK  JOIN Articulo A ON A.artIdPK = AR.artIdFK WHERE artIdFK = " + artId;
            Connection();
            SqlCommand command = new SqlCommand(queryString, con)
            {
                CommandType = CommandType.Text
            };
            using (SqlDataReader reader = command.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        topicos.Add(reader[0].ToString());
                    }
                }
            }
            return topicos;
        }
        public void MarcarArticuloSolicitado(int artIdPk)
        {
            List<String> nombresUsuarioNucleo = RecuperarNombresUsuarioNucleo();
            Connection();
            var query = "INSERT INTO Nucleo_Solicita_Articulo VALUES (@nombreUsuario,@artID,@estado)";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                for (int index = 0; index < nombresUsuarioNucleo.Count; index++)
                {
                    cmd.Parameters.AddWithValue("@nombreUsuario", nombresUsuarioNucleo[index]);
                    cmd.Parameters.AddWithValue("@artID", artIdPk);
                    cmd.Parameters.AddWithValue("@estado", "solicitado");
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }
            }
            con.Close();

        }

        public string[] RetornarDatos(string artId) {
            string[] info = new string[2];
            string queryString = "SELECT titulo,resumen FROM Articulo  WHERE artIdPK = "+artId;
           
            Encoding unicode = Encoding.Unicode;
            Connection();


            SqlCommand command = new SqlCommand(queryString, con)
            {
                CommandType = CommandType.Text
            };
            using (SqlDataReader reader = command.ExecuteReader())
            {

                if (reader.Read()) {
                    info[0] = reader["titulo"].ToString();
                    info[1] = reader["resumen"].ToString();
                }
            }

            con.Close();
            return info;
        }

        public List<string> RetornarAutor(string artId)
        {
            List<string> autores = new List<string>();
            string queryString = "SELECT M.nombre+' '+M.apellido AS 'Nombre' FROM Articulo A JOIN Miembro_Articulo MA  ON A.artIdPK = MA.artIdFK JOIN Miembro M  ON M.nombreUsuarioPK = MA.nombreUsuarioFK WHERE A.artIdPK = "+artId;

            Connection();


            SqlCommand command = new SqlCommand(queryString, con)
            {
                CommandType = CommandType.Text
            };
            using (SqlDataReader reader = command.ExecuteReader())
            {

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        autores.Add(reader[0].ToString());
                    }
                }
            }

            con.Close();
            return autores;
        }

        public List<List<string>> RetornarArticulosPendientes(string nombreUsuarioActual, string estado)
        {
            DataTable dTable = new DataTable();
            SqlCommand command = null;
            string query = "";
            Connection();
            
            if (estado == "pendiente")
            {
                query = "SELECT A.artIdPK,A.titulo,A.resumen,M.nombre+' '+M.apellido AS [Nombre Completo],M.nombreUsuarioPK FROM Articulo A JOIN Miembro_Articulo MA ON A.artIdPK = MA.artIdFK JOIN Miembro M  ON M.nombreUsuarioPK  = MA.nombreUsuarioFK WHERE A.estado = 'pendiente' ORDER BY A.artIdPK";
                command = new SqlCommand(query, con)
                {
                    CommandType = CommandType.Text
                };
            }
            else if (estado == "solicitado")
            {
                query = "SELECT DISTINCT A.artIdPK,A.titulo,A.resumen,M.nombre+' '+M.apellido AS [Nombre Completo],M.nombreUsuarioPK FROM Articulo A JOIN Miembro_Articulo MA ON A.artIdPK = MA.artIdFK JOIN Miembro M ON M.nombreUsuarioPK  = MA.nombreUsuarioFK JOIN Nucleo_Solicita_Articulo NS ON A.artIdPK = NS.artIdFK WHERE NS.nombreUsuarioFK = @nombreUsuario AND Ns.estadoSolicitud = 'solicitado'  ORDER BY A.artIdPK";
                command = new SqlCommand(query, con)
                {
                    CommandType = CommandType.Text
                };
                command.Parameters.AddWithValue("@nombreUsuario", nombreUsuarioActual);
            }
            else if (estado == "asignado") {
                query = "SELECT DISTINCT A.artIdPK,A.titulo,A.resumen,M.nombre+' '+M.apellido AS [Nombre Completo],M.nombreUsuarioPK FROM Articulo A JOIN Miembro_Articulo MA ON A.artIdPK = MA.artIdFK JOIN Miembro M ON M.nombreUsuarioPK = MA.nombreUsuarioFK JOIN Nucleo_Revisa_Articulo NA ON A.artIdPK = NA.artIdFK WHERE NA.nombreUsuarioFK = @nombreUsuario AND NA.estadoRevision = 'asignado' ORDER BY A.artIdPK";


                command = new SqlCommand(query, con)
                {
                    CommandType = CommandType.Text
                };
                command.Parameters.AddWithValue("@nombreUsuario", nombreUsuarioActual);
            }

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dTable);


            return LlenarArticulos(dTable, "pendientes");
        }

        private List<List<string>> LlenarArticulos(DataTable dTable, string tipo) {
            List<List<string>> ArticulosRetorno = new List<List<string>>();

            for (int index = 0; index < dTable.Rows.Count; index++)
            {
                string idAnterior = "";
                string idActual = dTable.Rows[index][0].ToString(); //ardIdPK actual

                if (index > 0)
                {
                    idAnterior = dTable.Rows[index - 1][0].ToString(); //ardIdPK de la iteración pasada
                }

                if (idActual != idAnterior)
                {
                    DataRow[] datosDeArticulo = dTable.Select("artIdPK = " + idActual); // devuelve los autores con ese artIdPK

                    string autores = "";
                    string usuarios = "";

                    for (int indexJ = 0; indexJ < datosDeArticulo.Length; indexJ++)
                    {
                        autores += datosDeArticulo[indexJ][3];
                        usuarios += datosDeArticulo[indexJ][4];
                        if (indexJ < datosDeArticulo.Length - 1)
                        {
                            autores += ",";
                            usuarios += ",";
                        }
                    }

                    if (tipo.Equals("pendientes"))
                    {
                        ArticulosRetorno.Add(new List<string> {
                                    dTable.Rows[index][0].ToString(), // artIdPK
                                    dTable.Rows[index][1].ToString(), // titulo
                                    autores,
                                    usuarios,
                        });
                    }
                    else if (tipo.Equals("todos")) {
                        ArticulosRetorno.Add(new List<string> {
                                    dTable.Rows[index][0].ToString(), // artIdPK
                                    dTable.Rows[index][1].ToString(), // titulo
                                    dTable.Rows[index][2].ToString(), // resumen
                                    autores,
                                    usuarios,
                        });
                    }
                }
            }

            con.Close();
            return ArticulosRetorno;
        }

        public void AsignarArticulo(int articuloId, string[] revisores) {

            Connection();

            string query = "INSERT INTO dbo.Nucleo_Revisa_Articulo(nombreUsuarioFK, artIdFK, estadoRevision) VALUES(@nombreUsuario, @articuloId, 'asignado')";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                for (int index = 0; index < revisores.Length; index++)
                {
                    cmd.Parameters.AddWithValue("@nombreUsuario", revisores[index]);
                    cmd.Parameters.AddWithValue("@articuloId", articuloId);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }

            }
            ActualizarEstado(articuloId, "revision");

            con.Close();

        }

        private void ActualizarEstado(int articuloId, string estado) {
            string query = "UPDATE Articulo SET estado = @estado WHERE artIdPK = @articuloId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@articuloId", articuloId);
                cmd.Parameters.AddWithValue("@estado", estado);
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
            }
        }

        public List<List<string>> RetornarResultadoSolicitud(int articuloId)
        {
            List<List<string>> ResultadoSolicitud = new List<List<string>>();
            string query = "SELECT NS.nombreUsuarioFK AS [Nombre de Usuario], NS.estadoSolicitud AS [Solicitud] FROM dbo.Nucleo_Solicita_Articulo NS WHERE NS.artIdFK = @articuloId";

            Connection();

            SqlCommand command = new SqlCommand(query, con)
            {
                CommandType = CommandType.Text    
            };

            command.Parameters.AddWithValue("@articuloId", articuloId);

            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    ResultadoSolicitud.Add(new List<string> {
                                                            reader[0].ToString(), //nombreUsuarioFK
                                                            reader[1].ToString() //estadoSolicitud
                                                            });
                }

            }

            con.Close();

            return ResultadoSolicitud;
        }

        public void ModificarEstadoSolicitud(int artID, string nombreUsuarioActual, string estadoSolicitud)
        {
            Connection();
            string query = "UPDATE Nucleo_Solicita_Articulo SET estadoSolicitud = @estado WHERE artIdFK = @articuloId AND nombreUsuarioFK = @nombreUsuario";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@articuloId", artID);
                cmd.Parameters.AddWithValue("@estado", estadoSolicitud);
                cmd.Parameters.AddWithValue("@nombreUsuario", nombreUsuarioActual);
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
            }
        }

        public List<List<string>> RetornarRevisados()
        {
            List<List<string>> ArticulosRevisados = new List<List<string>>();
            string queryString = "SELECT DISTINCT A.artIdPK,A.titulo,A.resumen,M.nombre+' '+M.apellido AS [Nombre Autor],M.nombreUsuarioPK AS 'Username Autor',NR.puntuacion,NR.comentarios,M2.nombre+' '+M2.apellido AS 'Nombre Revisor',M2.nombreUsuarioPK  FROM Articulo A JOIN Miembro_Articulo MA ON A.artIdPK = MA.artIdFK JOIN Miembro M ON M.nombreUsuarioPK = MA.nombreUsuarioFK JOIN Nucleo_Revisa_Articulo NR ON A.artIdPK = NR.artIdFK JOIN Miembro M2 ON M2.nombreUsuarioPK = NR.nombreUsuarioFK WHERE NR.estadoRevision = 'revisado' ORDER BY A.artIdPK";

            Connection();

            SqlCommand command = new SqlCommand(queryString, con)
            {
                CommandType = CommandType.Text
            };

            DataTable dTable = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dTable);

            for (int index = 0; index < dTable.Rows.Count; index++)
            {
                string idAnterior = "";
                string idActual = dTable.Rows[index][0].ToString(); //ardIdPK actual
                string userRAnterior = "";
                string userRActual = dTable.Rows[index][8].ToString(); //userName actual

                if (index > 0)
                {
                    idAnterior = dTable.Rows[index - 1][0].ToString(); //ardIdPK de la iteración pasada
                    userRAnterior = dTable.Rows[index - 1][8].ToString();
                }

                if ((idActual != idAnterior) || (idActual == idAnterior && userRActual != userRAnterior) )
                {
                    DataRow[] datosDeArticulo = dTable.Select("artIdPK = " + idActual + " AND nombreUsuarioPK = '" + dTable.Rows[index][8].ToString() + "'"); // devuelve los autores con ese artIdPK

                    string autores = "";
                    string usuarios = "";

                    for (int indexJ = 0; indexJ < datosDeArticulo.Length; indexJ++)
                    {
                        autores += datosDeArticulo[indexJ][3];
                        usuarios += datosDeArticulo[indexJ][4];
                        if (indexJ < datosDeArticulo.Length - 1)
                        {
                            autores += ",";
                            usuarios += ",";
                        }
                    }

                    ArticulosRevisados.Add(new List<string> {
                                    dTable.Rows[index][0].ToString(), // artIdPK
                                    dTable.Rows[index][1].ToString(), // titulo
                                    autores,
                                    usuarios,
                                    dTable.Rows[index][5].ToString(), // Puntuacion
                                    dTable.Rows[index][6].ToString(), // Comentarios
                                    dTable.Rows[index][7].ToString(), // Nombre del revisor
                                    dTable.Rows[index][8].ToString()  // Username del revisor
                    });
                }
            }

            con.Close();

            return ArticulosRevisados;
        }

        public void ModificarEstadoArticulo(int artID, string estadoRevision,int puntuacion)
        {
            Connection();
            string query = "UPDATE Articulo SET estado = @estado, puntuacionInicial = @puntos WHERE artIdPK = @articuloId";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@articuloId", artID);
                cmd.Parameters.AddWithValue("@puntos", puntuacion);
                cmd.Parameters.AddWithValue("@estado", estadoRevision);
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
            }

            if(estadoRevision == "cambios")
            {
                query = "UPDATE Nucleo_Revisa_Articulo SET estadoRevision = @estado WHERE artIdFK = @articuloId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@articuloId", artID);
                    cmd.Parameters.AddWithValue("@estado", estadoRevision);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }
            }
            con.Close();
        }
    }
}