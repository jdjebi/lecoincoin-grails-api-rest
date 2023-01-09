<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main2"/>
    <title>Annonces - Lecoincoin</title>
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
                    <li class="breadcrumb-item active" aria-current="page">Annonces</li>
                </ol>
            </nav>
            <h2 class="h4">Liste des Annonces</h2>
        </div>

        <sec:ifAllGranted roles='ROLE_ADMIN'>
            <div class="btn-toolbar mb-2 mb-md-0">
                <g:link class="btn btn-sm btn-secondary d-inline-flex align-items-center" action="create">
                    <svg class="icon icon-xs me-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                    Créer
                </g:link>
            </div>
        </sec:ifAllGranted>
    </div>
    <div class="card border-0 shadow my-4">
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
                    <g:each status="i" in="${annonceList}" var="annonce">
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
                                        <g:link action="show" id="${annonce.id}" class="fw-extrabold">${annonce.title}</g:link>
                                        <div>
                                            <small>Last: ${annonce.lastUpdated}</small>
                                        </div>
                                        <div>
                                            <g:link controller="user" action="show" id="${annonce.author.id}" class="text-muted">
                                                <small>${annonce.author.nom} ${annonce.author.prenoms}</small>
                                            </g:link>
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
                                <g:link action="show" id="${annonce.id}" class="btn btn-secondary btn-sm">Consulter</g:link>
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