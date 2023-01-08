<!doctype html>
<html>
<head>
    <meta name="layout" content="main2"/>
    <title>Nouveau Annonce - Lecoincoin</title>
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
                <li class="breadcrumb-item" aria-current="page">
                    <g:link action="index">Utilisateurs</g:link>
                </li>
                <li class="breadcrumb-item active fw-bold" aria-current="page">Nouveau</li>
            </ol>
        </nav>
    </div>
</div>

<div class="row mt-3">
    <div class="col-12">
        <div class="card card-body border-0 shadow mb-4 py-4">
            <h2 class="h5 mb-4">Créer utilisateur</h2>
            <div>
                <g:hasErrors bean="${flash.errors}">
                    <ul class="text-danger" role="alert">
                        <g:eachError bean="${flash.errors}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
            </div>
            <g:form resource="${this.user}" method="POST">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="username">Nom utilisateur*</label>
                            <input class="form-control" id="username" name="username" type="text">
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="role">Rôle*</label>
                            <g:select from="${roleList}" class="form-control" required="true" name="role" optionKey="id" optionValue="${{it?.getRoleName()}}"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="nom">Nom</label>
                            <input class="form-control" id="nom" name="nom" type="text" value="${user.nom}">
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="prenoms">Prénoms</label>
                            <input class="form-control" id="prenoms" name="prenoms" type="text">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="password">Mot de passe*</label>
                            <input class="form-control" id="password" name="password" type="password">
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="confirm_password">Confirmation du mot de passe*</label>
                            <input class="form-control" id="confirm_password" name="confirm_password" type="password">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mt-2">
                        <div class="d-flex justify-content-end">
                            <g:submitButton name="create" class="btn btn-info" value="Enregistrer" />
                        </div>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>

</body>
</html>