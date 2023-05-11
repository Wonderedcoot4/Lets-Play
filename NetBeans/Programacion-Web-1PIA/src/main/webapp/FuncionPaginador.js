/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



function limpiarDashboard()
{
    $("rowPublicacion").empty();
}

/*var PagActual = 1;
 * 
 * 
 * Codigo js
 * $(#paginador).emtpy();
 * $(#pagindor).append(
 * $("<li>").addClass("page-item").append(
 *          $("<li>").addClass("page-link").text("Anterior")
 *          )
 *        );
 * 
 * 
 *  const totalPublics = data.[0].totalPublicaciones;
 *  const page = Math.ceil(totalPubliacione/10);
 *  for(var i = 0; i<page; i++)
 *  {
 *  var claseActual = ''
 *  if(pagActual == i + 1) claseActual = 'Active'
 *   $(#paginador).emtpy();
 *   $(#pagindor).append(
 *   $("<li>").addClass("page-item").append(
 *          $("<li>").addClass("page-link").text("Anterior")
 *          )
 *        );
 *  }
 *  
 *  
 *  function getPaginadorlicks()
 *  {
 * $(".page-item").on("click",function()
 * {
 * console.log("this", "(this));
 * var item = $(this).text();
 * var index = 0;
 * if(!$
 *  }
 *  para obtner el indice es tan simple como multiplicar el numero de pagina dode estoy, por la cantidad de publicaciones que quiero - menos la cantidad de publicaciones
 *  
 * 
 * 
 * Codigo Servlet
if (accion == "index")
List<Publicacion> pubIndex = null,
pubIndex = dao.getconsultarporindex();




Codigo dao
en el query pra obtener el recientes

DESC LIMIT + index +, cantidad


while(rs.next())
{

    pub.setid, pub.setTitulo


}

select count(*) as Total from publicacion

en el dao
while(rs.next())
total = res.getInt("Total")

Lo ponemos dentro del servlet 
int total = dao.getTotalPublicaciones


en el json donde se agrega lso elementos del json
podemos agregar el total
json.put("TotalPublis", total);





*/