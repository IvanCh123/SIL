using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Iteracion_2.Controllers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Iteracion_2.Pages.Articulos
{
    public class Articulos : PageModel
    {
        private ArticuloController ArticuloController { set; get; }
        public List<List<string>> ArticulosList { get; set; }

        public String[] Columnas = { "Titulo", "Resumen", "Autor", "Link" };

        public void OnGet()
        {
            ArticuloController = new ArticuloController();
            ArticulosList = ArticuloController.RetornarArticulos();
            //Response.Redirect(Location);
        }
    }
}