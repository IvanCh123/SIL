using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Iteracion_2.Models;
using Microsoft.AspNetCore.Mvc;

namespace Iteracion_2.Controllers
{
    public class RecomendacionController : Controller
    {
        public RecomendacionModel RecomendacionModel = new RecomendacionModel();
        public IActionResult Index()
        {
            return View();
        }

        public void RecomendarArticulo(string[] recomendacion)
        {
            RecomendacionModel.RecomendarArticulo(recomendacion);
        }

        public bool RetornarHaRecomendado(string[] datos)
        {
            return RecomendacionModel.RetornarHaRecomendado(datos);
        }
    }
}