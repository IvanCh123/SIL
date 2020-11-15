using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Iteracion_2.Models
{
    public class RecomendacionModel
    {
        private SqlConnection con;
        private ConexionModel connectionString { get; set; }

        public void Connection()
        {
            connectionString = new ConexionModel();
            con = connectionString.Connection();
        }

        public void RecomendarArticulo(string[] recomendacion)
        {
            string query = "INSERT INTO Miembro_Recomienda VALUES(@nombreUsuario, @articuloId, @titulo, @comentario)";

            Connection();

            SqlCommand command = new SqlCommand(query, con)
            {
                CommandType = CommandType.Text

            };

            //[0] = nombreUsuario, [1] = articuloId, [2] = titulo, [3] = comentario
            command.Parameters.AddWithValue("@nombreUsuario", recomendacion[0]);
            command.Parameters.AddWithValue("@articuloId", recomendacion[1]);
            command.Parameters.AddWithValue("@titulo", recomendacion[2]);
            command.Parameters.AddWithValue("@comentario", recomendacion[3]);
            command.ExecuteNonQuery();

            con.Close();
        }

        public List<List<string>> RetornarRecomendaciones()
        {
            Connection();
            
            DataTable dTable = new DataTable();
            string query = "SELECT A.artIdPK, A.titulo, MR.titulo as [Titulo Recomendacion], MR.comentario ,M2.nombre+' '+M2.apellido AS [Nombre Autor], M2.nombreUsuarioPK, M.nombre+' '+M.apellido AS [Recomendador], M.nombreUsuarioPK AS [UsuarioR]  " +
                "FROM Articulo A " +
                "JOIN Miembro_Recomienda MR ON A.artIdPK = MR.artIdFK " +
                "JOIN Miembro M ON M.nombreUsuarioPK = MR.nombreUsuarioFK " +
                "JOIN Miembro_Articulo MA ON A.artIdPK = MA.artIdFK " +
                "JOIN Miembro M2 ON M2.nombreUsuarioPK = MA.nombreUsuarioFK ORDER BY A.artIdPK";

            SqlCommand command = new SqlCommand(query, con)
            {
                CommandType = CommandType.Text
            };

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dTable);

            con.Close();

            return AcomodarRecomendaciones(dTable);
        }


        public List<List<string>> AcomodarRecomendaciones(DataTable dTable) {
            List<List<string>> RecomendacionesRetorno = new List<List<string>>();

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

                    //recorremos el subset que contiene todos los datos de un id
                    for (int indexJ = 0; indexJ < datosDeArticulo.Length; indexJ++)
                    {
                        string recomendadorAnterior = ""; //ardIdPK actual
                        string recomendadorActual = datosDeArticulo[indexJ][7].ToString(); //ardIdPK actual

                        if (indexJ > 0)
                            recomendadorAnterior = datosDeArticulo[indexJ - 1][7].ToString(); //recomendadorAnterior de la iteración pasada

                        if (recomendadorActual != recomendadorAnterior)
                        {

                            List<List<string>> datosRecomendacion = new List<List<string>>();
                            //ahora generamos un arreglo de los de este id con el mismo recomendador
                            for (int indexDR = 0; indexDR < datosDeArticulo.Length; indexDR++)
                            {
                                string recomendadorP = ""; //recomendador pasado
                                string recomendadorA = datosDeArticulo[indexDR][7].ToString(); //recomendador actual

                                if (indexDR == 0)
                                    recomendadorP = recomendadorActual;
                                else if (indexDR > 0)
                                    recomendadorP = datosDeArticulo[indexDR - 1][7].ToString();

                                if (recomendadorA == recomendadorActual)
                                {
                                    datosRecomendacion.Add(new List<string>
                                    {
                                        datosDeArticulo[indexDR][0].ToString(),
                                        datosDeArticulo[indexDR][1].ToString(),
                                        datosDeArticulo[indexDR][2].ToString(),
                                        datosDeArticulo[indexDR][3].ToString(),
                                        datosDeArticulo[indexDR][4].ToString(),
                                        datosDeArticulo[indexDR][5].ToString(),
                                        datosDeArticulo[indexDR][6].ToString(),
                                        datosDeArticulo[indexDR][7].ToString()
                                    });
                                }
                            }

                            string autores = "";
                            string usuarios = "";
                            //ahora le buscamos los autores y usuarios del nuevo arreglo generado
                            for (int indexDR = 0; indexDR < datosRecomendacion.Count; indexDR++)
                            {
                                autores += datosRecomendacion[indexDR][4];
                                usuarios += datosRecomendacion[indexDR][5];
                                if (indexDR < datosRecomendacion.Count - 1)
                                {
                                    autores += ",";
                                    usuarios += ",";
                                }
                            }

                            // utilizar la primera posicion del arreglo generado no el original
                            RecomendacionesRetorno.Add(new List<string> {
                                datosRecomendacion[0][0].ToString(), // artIdPK
                                datosRecomendacion[0][1].ToString(), // Titulo artículo
                                datosRecomendacion[0][2].ToString(), // Titulo Recomendacion
                                datosRecomendacion[0][3].ToString(), // Comentario Recomendacion
                                autores,
                                usuarios,
                                datosRecomendacion[0][6].ToString(), // Nombre Recomendador
                                datosRecomendacion[0][7].ToString(), // Usuario Recomendador
                            });

                        }
                    }

                }
            }


            return RecomendacionesRetorno;
        }

        public bool RetornarHaRecomendado(string[] datos)
        {
            string query = "SELECT * FROM Miembro_Recomienda WHERE nombreUsuarioFK = @nombreUsuario AND artIdFK = @articuloId;";
            bool haRecomendado = false;
            Connection();

            SqlCommand command = new SqlCommand(query, con)
            {
                CommandType = CommandType.Text

            };

            //[0] = nombreUsuario, [1] = articuloId
            command.Parameters.AddWithValue("@nombreUsuario", datos[0]);
            command.Parameters.AddWithValue("@articuloId", datos[1]);

            using (SqlDataReader reader = command.ExecuteReader())
            {
                haRecomendado = reader.HasRows;
            }

            return haRecomendado;
        }
    }
}
