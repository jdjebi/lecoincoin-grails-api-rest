<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main2" />
    <title>Annonce #${annonce.id} - Lecoincoin</title>
</head>
<body>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center">
        <div class="d-block mb-4 mb-md-0">
            <nav aria-label="breadcrumb" class="d-none d-md-inline-block">
                <ol class="breadcrumb breadcrumb-dark breadcrumb-transparent">
                    <li class="breadcrumb-item">
                        <a href="#">
                            <svg class="icon icon-xxs" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path></svg>
                        </a>
                    </li>
                    <li class="breadcrumb-item">
                        <g:link action="index">Annonces</g:link>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Annonce #${annonce.id}</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-12">
            <div class="card card-body border-0 shadow mb-4 py-4">
                <div class="d-flex justify-content-between">
                    <h2 class="h5 mb-4">Annonce #${annonce.id}</h2>
                    <g:form resource="${this.annonce}" method="DELETE">
                        <g:link action="edit" id="${annonce.id}" class="btn btn-sm btn-gray-200 d-inline-flex align-items-center">
                            Modifier
                        </g:link>
                        <button class="ms-2 btn btn-sm btn-danger d-inline-flex align-items-center" type="submit" onclick="return confirm('Confirmez vous la suppression ?')">
                            Supprimer
                        </button>
                    </g:form>
                </div>
                <div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div>
                                <label for="title">Titre</label>
                                <input class="form-control" id="title" type="text" value="${annonce.title}" disabled>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <div>
                                <label for="price">Prix</label>
                                <input class="form-control" id="price" type="number" value="${annonce.price}" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div>
                                <label for="price">Auteur (<g:link class="text-info small" controller="user2" action="show" id="${annonce.author.id}">Voir profil</g:link>)</label>
                                <input class="form-control" id="price" type="text" value="${annonce.author.nom} ${annonce.author.prenoms}" disabled/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <div>
                                <label for="description">Description</label>
                                <textarea class="form-control" rows="5" id="description" type="text" disabled>${annonce.description}</textarea>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div class="form-group">
                                <label for="dateCreated">Date ajout</label>
                                <input class="form-control" id="dateCreated" type="text" value="${annonce.dateCreated}" disabled>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <div class="form-group">
                                <label for="lastUpdated">Date dernière modification</label>
                                <input class="form-control" id="lastUpdated" type="text" value="${annonce.lastUpdated}" disabled>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="isActive" checked="${annonce.isActive}" disabled>
                                    <label class="form-check-label" for="isActive">Activé</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="card card-body border-0 shadow mb-4 py-4">
               <div class="d-flex justify-content-between align-items-center">
                   <h2 class="h5 mb-4">Illustrations</h2>
                   <div>
                       <g:link action="edit" id="${annonce.id}#edit-illustration" class="btn btn-sm btn-gray-200 d-inline-flex align-items-center">
                           Mettre à jour
                       </g:link>
                   </div>
               </div>
                <div class="row">
                    <g:each status="i" in="${annonce.illustrations}" var="illustration">
                        <div class="col-12 col-md-6">
                            <div class="d-flex align-items-center m-1 p-3 rounded-3 border">
                                <div>
                                    <div class="text-center">
                                        <asset:image src="${illustration.filename}" height="150" width="150" alt="Illustration ${illustration.id} of Annonce ${annonce.id}"/>
                                    </div>
                                </div>
                                <div class="small ms-4">
                                    <div><b>Accès local:</b> ${illustration.filename}</div>
                                    <div><b>Accès distant:</b> ${illustration.extern_filepath}</div>
                                    <small class="mt-1">Ajouté le ${illustration.dateCreated}</small>
                                </div>
                            </div>
                        </div>
                    </g:each>
                </div>

            </div>
        </div>
    </div>
    <%--
        <a href="#show-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-annonce" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="annonce" />
            <g:form resource="${this.annonce}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.annonce}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
        --%>
    </body>
</html>
