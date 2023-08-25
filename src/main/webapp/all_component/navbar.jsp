<style>
    .navbar .nav-item .nav-link {
        font-size: 20px;
        color: white;
    }

    .navbar-custom .nav-item:hover .nav-link {
        background: white;
        color: black;
        border-radius: 10px;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-custom" style="background: #245caa;">
    <div class="container-fluid">
        <a class="navbar-brand" style="color: #ffff; font-size: 27px"><i class="bi bi-journals" aria-hidden="true"></i> ENotes</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-plus-circle" aria-hidden="true"></i> Add Notes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa-solid fa-address-book"></i> Show Notes</a>
                </li>
            </ul>
            <form class="d-flex gap-2" role="search">
                <a href="login.jsp" class="btn btn-outline-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-circle-user"></i> Login</a>
                <a href="register.jsp" class="btn btn-outline-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-user-plus"></i> Register</a>
            </form>
        </div>
    </div>
</nav>