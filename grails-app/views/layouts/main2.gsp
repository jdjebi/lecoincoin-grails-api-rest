<!doctype html>
<html lang="en" class="no-js">
<head>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="lecoincoin.ico" type="image/x-ico" />
    <asset:stylesheet src="application2.css"/>
    <g:layoutHead/>
</head>
<body>

    <nav class="navbar navbar-dark navbar-theme-primary px-4 col-12 d-lg-none">
        <a class="navbar-brand me-lg-5" href="/j">
            <asset:image class="navbar-brand-dark" src="lecoincoin.png"/>
        </a>
        <div class="d-flex align-items-center">
            <button class="navbar-toggler d-lg-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>

    <nav id="sidebarMenu" class="sidebar d-lg-block bg-gray-800 text-white collapse" data-simplebar="init">
        <div class="simplebar-wrapper" style="margin: 0px;">
            <div class="simplebar-height-auto-observer-wrapper">
                <div class="simplebar-height-auto-observer"></div>
            </div>
            <div class="simplebar-mask">
                <div class="simplebar-offset" style="right: 0px; bottom: 0px;">
                    <div class="simplebar-content-wrapper" tabindex="0" role="region" aria-label="scrollable content" style="height: auto; overflow: hidden scroll;">
                        <div class="simplebar-content" style="padding: 0px;">
                            <div class="sidebar-inner px-4 pt-3">
                                <div class="user-card d-flex d-md-none align-items-center justify-content-between justify-content-md-center pb-4">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-lg me-4">
                                            <asset:image src="avatar.png" class="card-img-top rounded-circle border-white" alt="Bonnie Green"/>
                                        </div>
                                        <div class="d-block">
                                            <h2 class="h5 mb-3">Hi, Jane</h2>
                                            <g:link controller="logout" action="index" class="btn btn-secondary btn-sm d-inline-flex align-items-center">
                                                <svg class="icon icon-xxs me-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                                                </svg>
                                                Déconnexion
                                            </g:link>
                                        </div>
                                    </div>
                                    <div class="collapse-close d-md-none">
                                        <a href="#sidebarMenu" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="true" aria-label="Toggle navigation">
                                            <svg class="icon icon-xs" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                                <ul class="nav flex-column pt-3 pt-md-0">
                                    <li class="nav-item">
                                        <a href="/" class="nav-link d-flex align-items-center">
                                            <span class="sidebar-icon">
                                                <asset:image src="lecoincoin.png" width="30" alt="Volt Logo"/>
                                            </span>
                                            <span class="mt-1 ms-1 sidebar-text fs-5 fw-bold">Lecoincoin</span>
                                        </a>
                                    </li>
                                    <sec:ifNotGranted roles='ROLE_CLIENT'>
                                        <li class="nav-item ${request.forwardURI.contains('user') ? 'active' : ''}">
                                            <a href="/user" class="nav-link ">
                                                <span class="sidebar-icon">
                                                    <svg class="icon icon-xs me-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6">
                                                        <path fill-rule="evenodd" d="M8.25 6.75a3.75 3.75 0 117.5 0 3.75 3.75 0 01-7.5 0zM15.75 9.75a3 3 0 116 0 3 3 0 01-6 0zM2.25 9.75a3 3 0 116 0 3 3 0 01-6 0zM6.31 15.117A6.745 6.745 0 0112 12a6.745 6.745 0 016.709 7.498.75.75 0 01-.372.568A12.696 12.696 0 0112 21.75c-2.305 0-4.47-.612-6.337-1.684a.75.75 0 01-.372-.568 6.787 6.787 0 011.019-4.38z" clip-rule="evenodd" />
                                                        <path d="M5.082 14.254a8.287 8.287 0 00-1.308 5.135 9.687 9.687 0 01-1.764-.44l-.115-.04a.563.563 0 01-.373-.487l-.01-.121a3.75 3.75 0 013.57-4.047zM20.226 19.389a8.287 8.287 0 00-1.308-5.135 3.75 3.75 0 013.57 4.047l-.01.121a.563.563 0 01-.373.486l-.115.04c-.567.2-1.156.349-1.764.441z" />
                                                    </svg>
                                                </span>
                                                <span class="sidebar-text">Utilisateurs</span>
                                            </a>
                                        </li>
                                    </sec:ifNotGranted>
                                    <li class="nav-item ${request.forwardURI.contains('annonce') ? 'active' : ''}">
                                        <a href="/annonce" class="nav-link d-flex justify-content-between">
                                            <span>
                                                <span class="sidebar-icon">
                                                    <svg class="icon icon-xs me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
                                                    </svg>
                                                </span>
                                                <span class="sidebar-text">Annonces</span>
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="simplebar-placeholder" style="width: auto; height: 621px;"></div>
        </div>
        <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
            <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
        </div>
        <div class="simplebar-track simplebar-vertical" style="visibility: visible;">
            <div class="simplebar-scrollbar" style="height: 310px; display: block; transform: translate3d(0px, 64px, 0px);"></div>
        </div>
    </nav>

    <main class="content">
        <nav class="navbar navbar-top navbar-expand navbar-dashboard navbar-dark ps-0 pe-2 pb-0">
            <div class="container-fluid px-0">
                <div class="d-flex justify-content-between w-100" id="navbarSupportedContent">
                    <div class="d-flex align-items-center">

                        <sec:ifNotGranted roles="ROLE_CLIENT">
                            <form action="/recherche" method="GET" class="navbar-search form-inline">
                                <div class="input-group input-group-merge search-bar">
                                    <button type="submit" class="input-group-text" id="topbar-addon">
                                        <svg class="icon icon-xs" x-description="Heroicon name: solid/search" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                            <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path>
                                        </svg>
                                    </button>
                                    <input name="q" type="text" class="form-control" id="topbarInputIconLeft" placeholder="Rechercher une annonce" aria-label="Search" aria-describedby="topbar-addon">
                                </div>
                            </form>
                        </sec:ifNotGranted>

                    <sec:ifAllGranted roles='ROLE_ADMIN'>
                        <div class="nav-item dropdown ms-lg-3">
                            <a class="nav-link dropdown-toggle pt-1 px-0" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <div class="media d-flex align-items-center">
                                    <div class="media-body ms-2 text-dark align-items-center d-none d-lg-block">
                                        <span class="mb-0 font-small fw-bold text-gray-900 d-flex align-items-center">
                                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="icon icon-xs me-1">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z" />
                                            </svg>
                                            Créer
                                        </span>
                                    </div>
                                </div>
                            </a>
                            <div class="dropdown-menu dashboard-dropdown dropdown-menu-end mt-2 py-1">
                                <g:link controller="user" action="create" class="dropdown-item d-flex align-items-center" href="#">
                                    <svg class="icon icon-xs me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />
                                    </svg>
                                    Utilisateur
                                </g:link>
                                <div role="separator" class="dropdown-divider my-1"></div>
                                <g:link controller="annonce" action="create" class="dropdown-item d-flex align-items-center" href="#">
                                    <svg class="icon icon-xs me-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z" />
                                    </svg>
                                    Annonce
                                </g:link>
                            </div>
                        </div>
                    </sec:ifAllGranted>
                    </div>
                    <ul class="navbar-nav align-items-center">
                        <li class="nav-item dropdown ms-lg-3">
                            <a class="nav-link dropdown-toggle pt-1 px-0" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <div class="media d-flex align-items-center">
                                    <asset:image class="avatar rounded-circle" alt="Image placeholder" src="avatar.png"/>
                                    <div class="media-body ms-2 text-dark align-items-center d-none d-lg-block">
                                        <span class="mb-0 font-small fw-bold text-gray-900"> <sec:loggedInUserInfo field="username"/> </span>
                                    </div>
                                </div>
                            </a>
                            <div class="dropdown-menu dashboard-dropdown dropdown-menu-end mt-2 py-1">
                                <g:link class="dropdown-item d-flex align-items-center" controller="user" action="show" id="${sec.loggedInUserInfo(field: 'id')}">
                                    <svg class="dropdown-icon text-gray-400 me-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"></path>
                                    </svg>
                                    Profil
                                </g:link>
                                <div role="separator" class="dropdown-divider my-1"></div>
                                <g:link class="dropdown-item d-flex align-items-center" controller="logout" action="index">
                                    <svg class="dropdown-icon text-danger me-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                                    </svg>
                                    Déconnexion
                                </g:link>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <g:if test="${flash.message}">
            <div class="alert alert-info mt-3 alert-dismissible fade show" role="alert">
                ${flash.message}
                <button type="button" class="btn-close btn-sm" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </g:if>
        <div class="py-4"></div>
        <g:layoutBody/>
    </main>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
    <asset:javascript src="vendor/@popperjs/core/dist/umd/popper.min.js"/>
    <asset:javascript src="vendor/bootstrap/dist/js/bootstrap.min.js"/>
    <asset:javascript src="vendor/onscreen/dist/on-screen.umd.min.js"/>
    <asset:javascript src="vendor/nouislider/distribute/nouislider.min.js"/>
    <asset:javascript src="vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"/>
    <asset:javascript src="vendor/sweetalert2/dist/sweetalert2.all.min.js"/>
    <asset:javascript src="vendor/notyf/notyf.min.js"/>
    <asset:javascript src="vendor/simplebar/dist/simplebar.min.js"/>
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <asset:javascript src="js/volt.js"/>

</body>
</html>
