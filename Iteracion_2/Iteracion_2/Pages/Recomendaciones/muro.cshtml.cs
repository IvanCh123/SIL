using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Iteracion_2.Controllers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Iteracion_2.Pages.Recomendaciones
{
    public class muroModel : PageModel
    {
        private RecomendacionController RecomendacionController { set; get; }
        public List<List<string>> RecomendacionesList { get; set; }

        public void OnGet()
        {
            RecomendacionController = new RecomendacionController();
            RecomendacionesList = RecomendacionController.RetornarRecomendaciones();
        }
    }
}
