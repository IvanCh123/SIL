using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Iteracion_2.Models;

namespace Iteracion_2.Controllers
{
    public class ArticuloController : Controller
    {
        private ArticuloModel ArticuloModel = new ArticuloModel();

        public List<List<string>> RetornarArticulosPendientes(string nombreUsuarioActual, string estado)
        {
            return ArticuloModel.RetornarArticulosPendientes(nombreUsuarioActual, estado);
        }

        public List<List<string>> RetornarArticulos()
        {
            return ArticuloModel.RetornarArticulos();
        }

        public List<List<string>> RetornarRevisados ()
        {
            return ArticuloModel.RetornarRevisados();
        }

        public string[] RetornarDatos(string artId) {
            return ArticuloModel.RetornarDatos(artId);
        }

        public List<string> RetornarAutor(string artId)
        {
            return ArticuloModel.RetornarAutor(artId);
        }

        public void MarcarArtSolicitado(int artID)
        {
            ArticuloModel.MarcarArticuloSolicitado(artID);
        }

        public void AsignarArticulo(int articuloId, string[] revisores)
        {
            ArticuloModel.AsignarArticulo(articuloId, revisores);
        }

        public List<List<string>> RetornarResultadoSolicitud(int articuloId)
        {
            return ArticuloModel.RetornarResultadoSolicitud(articuloId);
        }

        public void ModificarEstadoSolicitud(int artID, string nombreUsuarioActual, string estadoSolicitud)
        {
            ArticuloModel.ModificarEstadoSolicitud(artID, nombreUsuarioActual, estadoSolicitud);
        }

        public void ModificarEstadoArticulo(int artID, string estadoRevision, int puntuacion)
        {
            ArticuloModel.ModificarEstadoArticulo(artID, estadoRevision,puntuacion);
        }
    }
}