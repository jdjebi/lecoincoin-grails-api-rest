<!doctype html>
<html>
<head>
    <meta name="layout" content="main2"/>
    <title>Lecoincoin</title>
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
                    <a href="/user2">Utilisateurs</a>
                </li>

                <li class="breadcrumb-item" aria-current="page">
                    <a href="/user2/show/${user.id}">${user.username} #${user.id}</a>
                </li>

                <li class="breadcrumb-item active fw-bold" aria-current="page">Modifier</li>
            </ol>
        </nav>
    </div>
</div>

<div class="row mt-3">
    <div class="col-12">
        <div class="card card-body border-0 shadow mb-4 py-4">
            <h2 class="h5 mb-4">Modifications</h2>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
                <ul class="errors text-danger" role="alert">
                    <g:eachError bean="${this.user}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form url="/user/update" resource="${user}" method="PUT">
                <g:hiddenField name="version" value="${user?.version}" />
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="username">Nom utilisateur*</label>
                            <input class="form-control" id="username" type="text" name="username" value="${user.username}" required="required">
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
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div>
                            <label for="prenoms">Prénoms</label>
                            <input class="form-control" id="prenoms" name="prenoms" type="text" value="${user.prenoms}">
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-end">
                    <g:submitButton name="update" class="btn btn-info" value="Enregistrer" />
                </div>
            </g:form>
        </div>
    </div>
</div>

</body>
</html>