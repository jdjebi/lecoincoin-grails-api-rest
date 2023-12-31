<!doctype html>
<html>
<head>
    <meta name="layout" content="main2"/>
    <title>Utilisateur #${user.id} - Lecoincoin</title>
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
                <li class="breadcrumb-item active fw-bold" aria-current="page">${user.username} #${user.id}</li>
            </ol>
        </nav>
    </div>
</div>

<div class="row mt-3">
    <div class="col-12">
        <div class="card card-body border-0 shadow mb-4 py-4">
            <div class="d-flex justify-content-between">
                <h2 class="h5 mb-4">Utilisateur #${user.id}</h2>
                <sec:ifAllGranted roles='ROLE_ADMIN'>
                    <g:form resource="${user}" method="DELETE">
                        <g:hiddenField name="version" value="${user.version}" />
                        <g:link action="edit" id="${user.id}" class="btn btn-sm btn-gray-200 d-inline-flex align-items-center">
                            Modifier
                        </g:link>
                        <button class="ms-2 btn btn-sm btn-danger d-inline-flex align-items-center" type="submit" onclick="return confirm('Confirmez vous la suppression ?')">
                            Supprimer
                        </button>
                    </g:form>
                </sec:ifAllGranted>
            </div>
            <div>
                <div class="row">
                    <div class="col-12 col-md-3">
                        <div class="text-center">
                            <div>
                                <asset:image src="${user.photo}" class="rounded-circle" width="150"/>
                            </div>
                            <div>
                                <g:each in="${user.getAuthorities()}" var="role">

                                    <g:if test="${role.authority == "ROLE_ADMIN"}">
                                        <span class="badge bg-primary">${role.getRoleName()}</span>
                                    </g:if>
                                    <g:elseif test="${role.authority == "ROLE_MOD"}">
                                        <span class="badge bg-indigo">${role.getRoleName()}</span>
                                    </g:elseif>
                                    <g:else>
                                        <span class="badge bg-info">${role.getRoleName()}</span>
                                    </g:else>

                                </g:each>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-9">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <div>
                                    <label for="username">Nom utilisateur</label>
                                    <input class="form-control" id="username" type="text" value="${user.username}" disabled>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <div>
                                    <label for="role">Rôle</label>
                                    <input class="form-control" id="role" type="text" value="${user.getAuthorities()[0].authority}" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <div>
                                    <label for="nom">Nom</label>
                                    <input class="form-control" id="nom" type="text" value="${user.nom}" disabled>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <div>
                                    <label for="prenoms">Prénoms</label>
                                    <input class="form-control" id="prenoms" type="text" value="${user.prenoms}" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <div class="form-group">
                                    <label for="dateCreated">Date ajout</label>
                                    <input class="form-control" id="dateCreated" type="text" value="${user.dateCreated}" disabled>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <div class="form-group">
                                    <label for="lastUpdated">Date dernière modification</label>
                                    <input class="form-control" id="lastUpdated" type="text" value="${user.lastUpdated}" disabled>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="card border-0 shadow my-4">
    <div class="card-header fw-extrabold">
        Annonces du l'utilisateur
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-striped table-centered table-nowrap mb-0 rounded">
                <thead class="thead-light">
                <tr>
                    <th class="border-0 rounded-start">#</th>
                    <th class="border-0">Titre (With Illustration)</th>
                    <th class="border-0">Description</th>
                    <th class="border-0">Prix</th>
                    <th class="border-0">Activé</th>
                    <th class="border-0 rounded-end">Actions</th>
                </tr>
                </thead>
                <tbody>
                <g:each status="i" in="${user.annonces}" var="annonce">
                    <tr>
                        <td>${i+1}</td>
                        <td class="fw-bold">
                            <div class="d-flex align-items-center">
                                <div class="me-3" style="width: 50px">
                                    <g:if test="${annonce.illustrations}">
                                        <asset:image src="${annonce.illustrations[0].filename}" width="500"></asset:image>
                                    </g:if>
                                </div>
                                <div>
                                    <g:link controller="annonce" action="show" id="${annonce.id}" class="fw-extrabold">${annonce.title}</g:link>
                                    <div>
                                        <small>Last: ${annonce.lastUpdated}</small>
                                    </div>
                                </div>
                            </div>

                        </td>
                        <td>${annonce.description}</td>
                        <td class="fw-extrabold">${annonce.price}</td>
                        <td>
                            <g:if test="${annonce.isActive}">
                                <span class="badge bg-success">Activé</span>
                            </g:if>
                            <g:else>
                                <span class="badge bg-danger">Désactivé</span>
                            </g:else>
                        </td>
                        <td>
                            <g:link controller="annonce" action="show" id="${annonce.id}" class="btn btn-secondary btn-sm">Consulter</g:link>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
    <div class="d-flex justify-content-end">
        <div class="pagination">
            <g:paginate total="${annonceCount ?: 0}" />
        </div>
    </div>
</div>

</body>
</html>