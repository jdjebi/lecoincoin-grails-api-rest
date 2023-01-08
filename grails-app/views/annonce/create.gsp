<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main2" />
    <title>Nouveau Utilisateur - Lecoincoin</title>
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
                <li class="breadcrumb-item active" aria-current="page">Nouveau</li>
            </ol>
        </nav>
    </div>
</div>

<div class="row mt-3">
    <div class="col-12">
        <div class="card card-body border-0 shadow mb-4 py-4">
            <div class="d-flex justify-content-between">
                <h2 class="h5 mb-4">Créer utilisateur</h2>
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
            <g:form resource="${this.annonce}" method="POST">
                <g:hiddenField name="version" value="${annonce.version}" />
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="title">Titre*</label>
                            <input class="form-control" id="title" type="text" value="" name="title">
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="price">Prix*</label>
                            <input class="form-control" id="price" type="number" value="${annonce.price}" name="price">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="author">Auteur*</label>
                            <g:select id="author" from="${authors}" class="form-control" required="true" name="author.id" optionKey="id" optionValue="${{it?.getFullId()}}"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <div>
                            <label for="description">Description*</label>
                            <textarea class="form-control" rows="5" id="description" name="description" type="text"></textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div>
                            <div class="form-check form-switch">
                                <input type="hidden" name="_isActive">
                                <input class="form-check-input" type="checkbox" name="isActive" id="isActive" checked>
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
</div>

</body>
</html>
