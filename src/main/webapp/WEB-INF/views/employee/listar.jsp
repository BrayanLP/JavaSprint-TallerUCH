<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<mt:template title="Empleados">
	<jsp:attribute name="content">
		
		
		
		<div class="container-fluid">
		     <!-- Breadcrumbs-->
		     <ol class="breadcrumb">
		       <li class="breadcrumb-item">
		         Configuraci&oacute;n
		       </li>
		       <li class="breadcrumb-item active">Gesti&oacute;n de Proveedores</li>
		     </ol>
		     
		     
		     <!-- Example DataTables Card-->
		     <div class="card mb-3">
		       <div class="card-header">
		         <i class="fa fa-table"></i>		         
		         <div class="btn-group">                    
	                    <select id="tipoBusquedaBE" class="form-control">   
	                    	<c:forEach var="tipoBusqueda" items="${lstTipoBusqueda}">
	                    		<option value="${tipoBusqueda.id}">${tipoBusqueda.descripcion}</option>
	                    	</c:forEach>
						</select>					
	                </div>
	                
	                <div class="btn-group">                                                            		                                        
	                    <input id="valor" maxlength="20" class="form-control" placeholder="Valor de búsqueda." />						
	                </div>
	                
	                <div class="btn-group">                    	                                        		                                        
	                    <input id="desdeFechaProv" class="form-control" value="${buscarProveedorBE.desdeFecha }" placeholder="Desde: dd/MM/yyyy" />	                    				
	                </div>
	                
	                <div class="btn-group">                                                            		                                        
	                    <input id="hastaFechaProv" class="form-control" value="${buscarProveedorBE.hastaFecha }" placeholder="Hasta: dd/MM/yyyy" />	                    					
	                </div>
	                
	                <div class="btn-group">
	                    <button id="btnBuscarProveedor" class="btn btn-primary width-100 mb-xs" role="button" type="button">
	                    	<i class="fa fa-search"></i>Buscar
	                    </button>
	                </div>                
	                 
	                <div class="btn-group pull-xs-right">	                    
						<button class="btn btn-inverse width-100 mb-xs" role="button" type="button" onclick="agregarProveedor()">
							<i class="fa fa-plus-circle"></i>Agregar
						</button>
	                </div>		         
		         
		        </div>
		         
		         
		       <div class="card-body">
		         <div class="table-responsive">
		         		         	
		         	<table id="tblProveedor" class="table table-bordered" width="100%" cellspacing="0">
	                        <thead>
		                        <tr>
									<th>RUC/DNI</th>
									<th>Raz&oacute;n Social</th>
									<th>Caserio</th>
									<th>Distrito</th>
									<th>Provincia</th>									
									<th>Tipo</th>		
									<th>Cuota</th>																										
									<th></th>
									<th></th>								
		                        </tr>
	                        </thead>
	                        <tbody>
	                        
	                        	<c:if test="${!empty lstProveedor}">
		                        	<c:forEach var="proveedor" items="${lstProveedor}">
										<tr id="proveedor${proveedor.idProveedor}">											
											<td>${proveedor.documentoIdentidad}</td>
											<td>${proveedor.descripcion}</td>
											<td>${proveedor.caserioBE.nombre}</td>
											<td>${proveedor.distritoBE.nombre}</td>
											<td>${proveedor.provinciaBE.nombre}</td>											
											<td>${proveedor.tipoProveedorBE.nombre}</td>
											<td>					                            
					                            <span class="input-group-append">
									                <button class="btn btn-info" type="button" onclick="verCuotas(${proveedor.idProveedor})">
									                  <i class="fa fa-bar-chart"></i>
									                </button>
									            </span>
											</td>																															
											<td>					                            
					                            <span class="input-group-append">
									                <button class="btn btn-primary" type="button" onclick="verProveedor(${proveedor.idProveedor})">
									                  <i class="fa fa-pencil-square-o"></i>
									                </button>
									            </span>
											</td>
											
											<td>
					                            <span class="input-group-append">
									                <button class="btn btn-danger" type="button" onclick="eliminarProveedor(${proveedor.idProveedor})">
									                  <i class="fa fa-trash-o"></i>
									                </button>
									            </span>
											</td>
										</tr>																				
									</c:forEach>
		                        </c:if>
		                        
	                        </tbody>
	                      </table>
	                      
	                      <input id="urlVerProveedor" type="hidden" value="${contextPath}/configuracion/proveedorws/informacion">
	                      <input id="urlEliminarProveedor" type="hidden" value="${contextPath}/configuracion/proveedorws/eliminar">
	                      <input id="_csrf" type="hidden" value="${_csrf.token}">
	                      <input id="urlGuardarProveedor" type="hidden" value="${contextPath}/configuracion/proveedorws/guardar">
	                      <input id="urlActualizarProveedor" type="hidden" value="${contextPath}/configuracion/proveedorws/actualizar">
	                      <input id="urlBuscarProveedor" type="hidden" value="${contextPath}/configuracion/proveedorws/buscar">
	                      <input id="urlListarPorPagina" type="hidden" value="${contextPath}/configuracion/proveedorws/listarPorPagina">
	                      <input id="urlListarTipoProveedor" type="hidden" value="${contextPath}/configuracion/tipoproveedorws/listar">
	                      <input id="urlListarCaserio" type="hidden" value="${contextPath}/configuracion/caseriows/listar">
	                      <input id="urlListarDistrito" type="hidden" value="${contextPath}/configuracion/distritows/listar">
	                      <input id="urlListarProvincia" type="hidden" value="${contextPath}/configuracion/provinciaws/listar">
	                      <input id="urlListarProvinciaPorDepartamento" type="hidden" value="${contextPath}/configuracion/provinciaws/listarPorDepartamento">
	                      <input id="urlListarDistritoPorProvincia" type="hidden" value="${contextPath}/configuracion/distritows/listarPorProvincia">
	                      <input id="urlListarCaserioPorDistrito" type="hidden" value="${contextPath}/configuracion/caseriows/listarPorDistrito">
	                      <input id="urlListarDepartamento" type="hidden" value="${contextPath}/configuracion/departamentows/listar">
	                      <input id="urlListarComiteBase" type="hidden" value="${contextPath}/configuracion/comitebasews/listar">
		         
		         </div>
		       </div>
		       <div class="card-footer small text-muted">
		       	<p id="pResultados">Se encontraron ${buscarProveedorBE.resultados } resultados.</p>
		       </div>
		        <div class="text-xs-center">
                <ul id="paginacion" class="pagination pagination-sm">
                	<c:if test="${!empty buscarProveedorBE.paginas}">
                		<c:forEach var="pagina" items="${buscarProveedorBE.paginas}">
                			<li class="page-item">
                				<a class="page-link" href="#" onclick="listarPorPagina(${pagina},${buscarProveedorBE.resultados})">${pagina }</a>
							</li>
                		</c:forEach>
                	</c:if>                        	

                </ul>
            </div>
		       		       
		     </div>
	    </div>
    	<!-- /.container-fluid-->
    			
        
      <!-- confirm dialog-->
      <div id="confirmarDialogo" title="Proveedores" style="display: none;">
		  <p>
				<span class="ui-icon ui-icon-alert" style="float: left; margin: 12px 12px 20px 0;">
		  	</span><span id="txtMensajeDialogo"></span>
		  </p>
		</div>
		
		      <!-- confirm dialog of delete-->
		      <div id="confirmarDialogoEliminar" title="Proveedores" style="display: none;">
		  <p>
				<span class="ui-icon ui-icon-alert" style="float: left; margin: 12px 12px 20px 0;">
		  	</span>Este elemento se eliminar&aacute; de forma permanente y no podr&aacute; recuperarse. ¿Est&aacute;s seguro?
		  </p>
		</div>	




 <!-- dialogo de informacion -->
      <div id="dialogoInformacionProv" title="Proveedores" style="display: none;">
		  
		  <div class="select-col">      
	          <label for="proveedor">RUC/DNI</label>
	          <input type="text" id="txtRucDni" maxlength="45" class="form-control" placeholder="Ingrese RUC/DNI.">	
	          <input type="hidden" id="txtIdProveedor">                  
		  </div>
		  
		  <div class="select-col">      
	          <label for="tipoProveedor" >Tipo Proveedor</label>
	          <select id="tipoProveedor" data-placeholder="Which galaxy is closest to Milky Way?" data-width="auto" data-minimum-results-for-search="10" tabindex="-1" class="select2 form-control"
					id="default-select">                             
                  <option value="0">Seleccionar</option>
              </select>                 
		  </div>
		  
		  <div class="select-col" style="width: 100%;">      
	          <label for="proveedor" >Raz&oacute;n Social</label>
	          <input type="text" id="txtDescripcion" maxlength="45" class="form-control"  placeholder="Ingrese aquí un nombre.">                 
		  </div>
		  
		  <div class="select-col">      
	          <label for="departamento" >Departamento</label>
	          <select id="departamento" data-placeholder="Which galaxy is closest to Milky Way?" data-width="auto" data-minimum-results-for-search="10" tabindex="-1" class="select2 form-control"
					id="default-select">                             
                   <option value="0">Seleccionar</option>
              </select>                 
		  </div>
		  
		  <div class="select-col">      
	           <label for="provincia" >Provincia</label>
	          <select id="provincia" data-placeholder="Which galaxy is closest to Milky Way?" data-width="auto" data-minimum-results-for-search="10" tabindex="-1" class="select2 form-control"
					id="default-select">                             
                 <option value="0">Seleccionar</option>
             </select>                 
		  </div>
		  
		  <div class="select-col">      
	           <label for="distrito" >Distrito</label>
	          <select id="distrito" data-placeholder="Which galaxy is closest to Milky Way?" data-width="auto" data-minimum-results-for-search="10" tabindex="-1" class="select2 form-control"
					id="default-select">                             
                             <option value="0">Seleccionar</option>
                         </select>                
		  </div>
		  
		  
		  <div class="select-col">      
	           <label for="caserio" >Caserio</label>
	          <select id="caserio" data-placeholder="Which galaxy is closest to Milky Way?" data-width="auto" data-minimum-results-for-search="10" tabindex="-1" class="select2 form-control"
					id="default-select">                             
                             <option value="0">Seleccionar</option>
                         </select>               
		  </div>
		  
		  <div class="select-col" style="width: 100%;">      
	          <label for="comitebase" >Comit&eacute; Base</label>
	          <select id="comitebase" data-placeholder="Which galaxy is closest to Milky Way?" data-width="auto" data-minimum-results-for-search="10" tabindex="-1" class="select2 form-control"
					id="default-select">                             
                             <option value="0">Seleccionar</option>
                         </select>                  
		  </div>
		  <div class="select-col" style="width: 100%;">      
	          <div class="mt" style="background: #97c7c5;">
	                   <span id="lblMensajeDialogoProv"></span>	                    
	           </div> <!-- end row -->               
		  </div>
		  
		</div>
		
        
		
	</jsp:attribute>
</mt:template>
<script type="text/javascript" src="${contextPath}/resources/js/app/proveedor.js"></script>
