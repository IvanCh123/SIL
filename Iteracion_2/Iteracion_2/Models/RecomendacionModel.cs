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
            List<List<string>> RecomendacionesRetorno = new List<List<string>>();
            DataTable dTable = new DataTable();
            string query = "SELECT A.artIdPK, A.titulo, MR.titulo as [Titulo Recomendacion], MR.comentario ,M2.nombre+' '+M2.apellido AS [Nombre Autor], M2.nombreUsuarioPK, M.nombre+' '+M.apellido AS [Nombre Completo] " +
                "FROM Articulo A " +
                "JOIN Miembro_Recomienda MR ON A.artIdPK = MR.artIdFK " +
                "JOIN Miembro M ON M.nombreUsuarioPK = MR.nombreUsuarioFK " +
                "JOIN Miembro_Articulo MA ON A.artIdPK = MA.artIdFK " +
                "JOIN Miembro M2 ON M2.nombreUsuarioPK = MA.nombreUsuarioFK";

            SqlCommand command = new SqlCommand(query, con)
            {
                CommandType = CommandType.Text
            };

            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dTable);

            con.Close();

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
                        autores += datosDeArticulo[indexJ][4];
                        usuarios += datosDeArticulo[indexJ][5];
                        if (indexJ < datosDeArticulo.Length - 1)
                        {
                            autores += ",";
                            usuarios += ",";
                        }
                    }

                    RecomendacionesRetorno.Add(new List<string> {
                            dTable.Rows[index][0].ToString(), // artIdPK
                            dTable.Rows[index][1].ToString(), // Titulo artículo
                            dTable.Rows[index][2].ToString(), // Titulo Recomendacion
                            dTable.Rows[index][3].ToString(), // Comentario Recomendacion
                            dTable.Rows[index][4].ToString(), // Nombre Recomendador
                            autores,
                            usuarios,                
                    });
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
