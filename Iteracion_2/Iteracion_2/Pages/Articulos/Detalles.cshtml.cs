using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Iteracion_2.Controllers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Iteracion_2.Pages.Articulos
{
    public class Detalles : PageModel
    {   
        public String idArticulo { set; get; }
        public void OnGet(String ID)
        {
            idArticulo = ID;
        }
    }
}