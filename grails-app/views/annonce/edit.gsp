<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main2" />
    <title>Modification - Annonce #${annonce.id} - Lecoincoin</title>
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
                    <li class="breadcrumb-item active" aria-current="page">
                        <g:link action="show" id="${annonce.id}">Annonce #${annonce.id}</g:link>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Modifier #${annonce.id}</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-12">
            <div class="card card-body border-0 shadow mb-4 py-4">
                <div class="d-flex justify-content-between">
                    <h2 class="h5 mb-4">Modifications</h2>
                </div>
                <div>
                    <g:hasErrors bean="${flash.errors}">
                        <ul class="text-danger" role="alert">
                            <g:eachError bean="${flash.errors}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>
                </div>
                <g:form resource="${annonce}" method="PUT">
                    <g:hiddenField name="version" value="${annonce.version}" />
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div>
                                <label for="title">Titre*</label>
                                <input class="form-control" id="title" type="text" value="${annonce.title}" name="title" required>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <div>
                                <label for="price">Prix*</label>
                                <input class="form-control" id="price" type="number" value="${annonce.price}" name="price" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div>
                                <label for="author">Auteur* (<g:link class="text-info small" controller="user" action="show" id="${annonce.author.id}">Voir profil</g:link>)</label>
                                <g:select id="author" from="${authors}" class="form-control" required="true" name="author.id" optionKey="id" value="${annonce.author.id}" optionValue="${{it?.getFullId()}}"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <div>
                                <label for="description">Description*</label>
                                <textarea class="form-control" rows="5" id="description" name="description" type="text" required>${annonce.description}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <div>
                                <div class="form-check form-switch">
                                    <input type="hidden" name="_isActive">
                                    <input class="form-check-input" type="checkbox" name="isActive" id="isActive" ${annonce.isActive ? "checked" : ""} required>
                                    <label class="form-check-label" for="isActive">Activé</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="d-flex justify-content-end">
                                <g:submitButton name="update" class="btn btn-info" value="Enregistrer" />
                            </div>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
        <div id="edit-illustration" class="col-12">
            <div class="card card-body border-0 shadow mb-4 py-4">
                <div class="d-flex justify-content-between align-items-center">
                    <h2 class="h5 mb-4">Illustrations</h2>
                    <div>
                        <g:link action="edit" id="${annonce.id}#edit-illustration" class="btn btn-sm btn-gray-200 d-inline-flex align-items-center" data-bs-toggle="modal" data-bs-target="#modal-default">
                            Ajouter
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
                                    <div class="mt-4">
                                        <g:form resource="${illustration}" method="DELETE">
                                            <fieldset class="buttons">
                                                <button class="btn btn-sm btn-danger" type="submit" onclick="return confirm('Confirmez vous la suppression')}');">
                                                    Supprimer
                                                </button>
                                            </fieldset>
                                        </g:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </g:each>
                </div>
            </div>
        </div>
    </div>

<div class="modal fade" id="modal-default" tabindex="-1" role="dialog" aria-labelledby="modal-default" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <g:form class="modal-content" url="/illustration/save?annonce.id=${annonce.id}" method="post" enctype="multipart/form-data">
            <div class="modal-header">
                <h2 class="h6 modal-title">Nouvelle illustration</h2>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <style>
                    .label-upload {
                        background-color: #000;
                        color: white;
                        padding: 0.5rem;
                        font-family: sans-serif;
                        border-radius: 0.3rem;
                        cursor: pointer;
                        margin-top: 1rem;
                    }

                    #file-chosen{
                        margin-left: 0.3rem;
                        font-family: sans-serif;
                    }
                </style>
                <div class="p-5 d-flex justify-content-center">
                    <div>
                        <input type="file" name="illustration" id="actual-btn" style="display: none" accept="image/*"/>
                        <label class="label-upload" for="actual-btn" class="btn btn-info">Choisir une image</label>
                        <span id="file-chosen">No file chosen</span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <g:submitButton name="create" class="btn btn-info" value="Enregistrer" />
                <button type="button" class="btn btn-link text-gray ms-auto" data-bs-dismiss="modal">Annuler</button>
            </div>
        </g:form>
    </div>
</div>

<script>
    const actualBtn = document.getElementById('actual-btn');

    const fileChosen = document.getElementById('file-chosen');

    actualBtn.addEventListener('change', function(){
        fileChosen.textContent = this.files[0].name
    })
</script>
</body>
</html>
