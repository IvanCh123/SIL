using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Iteracion_2.Controllers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Iteracion_2.Pages.Articulos
{
    public class TodosArticulosModel : PageModel
    {
        ArticuloController ArticuloController { set; get; }

        public List<List<string>> Articulos { get; set; }
        public void OnGet()
        {
            ArticuloController = new ArticuloController();
            Articulos = ArticuloController.RetornarArticulos();
            //Response.Redirect(Location);
        }
    }
}