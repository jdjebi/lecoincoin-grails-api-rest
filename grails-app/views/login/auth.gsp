<html>
<head>
    <title>
       Connexion - Lecoincoin
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <asset:stylesheet src="application2.css"/>
</head>
<body>
    <main>
        <section class="vh-lg-100 mt-5 mt-lg-0 bg-soft d-flex align-items-center">
        <div class="container">
            <div class="text-center mb-3">
                <div class="mb-1">
                    <asset:image src="lecoincoin.png" width="60"/>
                </div>
                <div>
                    <div class="fw-extrabold fs-3">Lecoincoin</div>
                </div>
            </div>
            <div class="row justify-content-center form-bg-image" data-background-lg="/assets/img/illustrations/signin.svg" style="background: url(/assets/img/illustrations/signin.svg);">
                <div class="col-12 d-flex align-items-center justify-content-center">
                    <div class="bg-white shadow border-0 rounded border-light p-4 p-lg-5 w-100 fmxw-500">
                        <div class="text-center text-md-center mb-4 mt-md-0">
                            <h1 class="mb-0 h3">Connexion au Backend</h1>
                        </div>
                        <g:if test='${flash.message}'>
                            <div class="text-center text-danger">${flash.message}</div>
                        </g:if>
                        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
                            <div class="form-group mb-4">
                                <label for="username">Votre nom utilisateur</label>
                                <div class="input-group">
                                    <span class="input-group-text" id="basic-addon1">
                                        <svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"></path><path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"></path></svg>
                                    </span>
                                    <input type="text" class="form-control" placeholder="Nom utilisateur" name="${usernameParameter ?: 'username'}" id="username" autofocus="">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-group mb-4">
                                    <label for="password">Votre mot de passe</label>
                                    <div class="input-group">
                                        <span class="input-group-text" id="basic-addon2">
                                            <svg class="icon icon-xs text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"></path></svg>
                                        </span>
                                        <input type="password" placeholder="Mot de passe" class="form-control" name="${passwordParameter ?: 'password'}" id="password">
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between align-items-top mb-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" value="" <g:if test='${hasCookie}'>checked="checked"</g:if>>
                                        <label class="form-check-label mb-0" for="remember_me">
                                            Resté connecté
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-gray-800">Connexion</button>
                            </div>
                        </form>
                        <div class="d-flex justify-content-center my-4">
                            <a class="btn btn-icon-only me-2"></a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    </main>
    <asset:javascript src="vendor/bootstrap/dist/js/bootstrap.min.js"/>
    <asset:javascript src="js/volt.js"/>
    <script>
        (function() {
            document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
        })();
    </script>
</body>
</html>
