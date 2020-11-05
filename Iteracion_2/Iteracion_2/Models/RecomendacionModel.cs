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
