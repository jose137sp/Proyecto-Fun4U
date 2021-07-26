<%-- 
    Document   : home
    Created on : Jul 22, 2021, 1:35:33 PM
    Author     : raulr
--%>

        <%@ include file="header.jsp"%>
        <%@page import="entidades.Memes"%>
        <%@page import="entidades.Personas"%>
        <%@page import="java.util.List"%>
        <%@page import="procesos.ProcesosMemes"%>


        <%
            int idUsuario = 0;
            char permisoUsuario = 'U';
            if(session.getAttribute("id_usuario") != null){
                idUsuario = (int)session.getAttribute("id_usuario");
                permisoUsuario = (char)session.getAttribute("permiso_usuario");
            }
  
            ProcesosMemes procesos = new ProcesosMemes();
            List<Memes> memes = procesos.GetAllMemes(permisoUsuario,idUsuario);
            
            
        %>
        
        <div class="container">
            <div class="row">
              <div class="col-10 col-lg-12 order-lg-1">
                <br>
                <section class="py-4">
                <%if(memes.size() > 0){%>
                  <%for(Memes meme : memes){%> 
                  <div class="mb-4 py-4">
                    <div class="d-flex justify-content-between align-items-center">
                      <div class="d-flex flex-row align-items-center">
                        <div class="avatar mr-3"><img class="avatar-img" src="<%= meme.getFoto_usuario()%>" alt="<%= meme.getNombre_usuario() %>"></div>
                        <div>
                          <h2 class="h6 mb-0"><%= meme.getNombre_usuario() %></h2>
                          <p class="small text-muted mb-0"><%= meme.getFecha() %></p>
                        </div>
                      </div>
                      
                    </div><img  class="rounded w-100 mt-3" src="<%= meme.getImagen_meme() %>" alt="<%= meme.getTitulo_meme() %>">
                    <div class="mt-3">
                      <h4 class="h5"><%= meme.getTitulo_meme() %></h4>
                      
                    </div>
                    <div class="d-flex justify-content-between">
                        <%if(meme.getLiked() == 0){%>
                            <a class="btn btn-default bg-transparent" onclick="<%procesos.DarLike(meme.getId_meme(),(int)session.getAttribute("id_usuario"));%>window.location.reload();"><i class="bi bi-heart text-danger"></i></a><p><%= meme.getLikes() %> likes</p>
                            <%}if(meme.getLiked() == 1){%>
                                <a class="btn btn-default bg-transparent" onclick="<%procesos.QuitarLike(meme.getId_meme(),(int)session.getAttribute("id_usuario"));%>window.location.reload();"><i class="bi bi-heart-fill text-danger"></i></a><p><%= meme.getLikes()%><p>
                            <%}%>
                         <% 
                             char permit =(char)session.getAttribute("permiso_usuario");
                            if( permit == 'A'){
                        %>
                                <button onclick=""><i class="fas fa-trash">Borrar meme</i>  </button>
                           
                         <%}%>
                      
                    </div>
                  </div>
                     <%}%>
                   <%}else{%>
                         <h2 style="margin-top: 100px; margin-left: 25%">No tienes amigos, prueba fun4you con amigos!</h2>
                     <%}%>
               
                </section>
              </div>
            </div>
        </div>

    </body>
</html>
