<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="gmc.FrmLogin" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Text" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" href="~/img/logo-blue-gmc.ico" />    
    <link href="bootstrap-5.3.6-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />    
    <link href="bootstrap-5.3.6-dist/css/bootstrap-icons.css" rel="stylesheet" type="text/css" />    
     <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.13.1/datatables.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.3.2/css/buttons.dataTables.min.css"/>

    <script src="bootstrap-5.3.6-dist/js/bootstrap.bundle.js" type="text/javascript"></script>
    <%--<script src="addons/bootstrap5/js/bootstrap.js" type="text/javascript"></script>--%>
    <script src="bootstrap-5.3.6-dist/js/jquery-3.6.0.js" type="text/javascript"></script>
    <%--<script src="addons/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>--%>
    <script src="Inputmask/dist/inputmask.js" type="text/javascript"></script>
    <style type="text/css">
        main {
           min-height: 80vh;
           height: auto !important;
           height: 100%;
           margin: 0 auto -60px;
        }
        * {
          /*font-family: "Noto Sans", sans-serif !important;*/
          font-size:  0.85rem !important;
        }
      .prev {
      font-size: 0;
      --mask: url("data:image/svg+xml,%0A%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' %3E%3Cline x1='19' y1='12' x2='5' y2='12'%3E%3C/line%3E%3Cpolyline points='12 19 5 12 12 5'%3E%3C/polyline%3E%3C/svg%3E") 50% 50% / contain no-repeat;
      -webkit-mask: var(--mask);
              mask: var(--mask);
       background: red;
    }

     .next {
      font-size: 0;
      --mask: url("data:image/svg+xml, %3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' %3E%3Cline x1='5' y1='12' x2='19' y2='12'%3E%3C/line%3E%3Cpolyline points='12 5 19 12 12 19'%3E%3C/polyline%3E%3C/svg%3E") 50% 50% / contain no-repeat;
      -webkit-mask: var(--mask);
              mask: var(--mask);
       background: blue;
    }
    
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }
      .auto_width
      {
          width: 130px;           
          overflow: auto; 
          white-space: normal;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      .popupout
    {
        
        z-index: 9;        
        background-color: white;
        position: relative;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="myspindiv" class="position-absolute top-50 start-50 popupout" >
            <h2>Loading data -- please wait"</h2>
            <img src="img/Spinner-5.gif" />
    </div>
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <%--<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp" class="img-fluid" alt="Sample image">--%>
        <img src="img/bg_mm2.png" class="img-fluid" alt="Sample image">
      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
        
         
          <!-- Email input -->
          <div data-mdb-input-init class="form-outline mb-4">
            <%--<input type="email" id="form3Example3" class="form-control form-control-lg" placeholder="Enter a valid email address" />--%>
            <asp:TextBox ID="txt_user"  runat="server" CssClass= "form-control form-control-lg" placeholder="Enter a valid User Name" ></asp:TextBox>
            <label class="form-label" for="form3Example3">User Name</label>
          </div>

          <!-- Password input -->
          <div data-mdb-input-init class="form-outline mb-3">
            <%--<input type="password" id="form3Example4" class="form-control form-control-lg" placeholder="Enter password" />--%>
            <asp:TextBox ID="txt_password"  runat="server" CssClass= "form-control form-control-lg" placeholder="Enter password" TextMode="Password"></asp:TextBox>
            <label class="form-label" for="form3Example4">Password</label>
          </div>

          

          <div class="text-center text-lg-start mt-4 pt-2">
            <%--<button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn bg-light btn-lg btn-outline-dark"
              style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>--%>
            <%--<p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="#!"
                class="link-danger">Register</a></p>--%>
                <asp:Button ID="cmd_login" runat="server" Text="Login" 
                              CssClass="btn  btn-lg btn-outline-dark" 
                              style="padding-left: 2.5rem; padding-right: 2.5rem;" onclick="cmd_login_Click" ></asp:Button>
          </div>
          <div class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-light">
        <!-- Copyright -->
        <div class="text-white mb-3 mb-md-0 bg-dark">
        Copyright © <%= DateTime.Now.Year.ToString() %>. All rights reserved.
        </div>
        <!-- Copyright -->


        </div>
        
      </div>
    </div>

    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            //$('[id*=DropDownList1],[id*=cb_irnumber]').select2();
            //$('[id*=cb_car]').select2({ width: '100%' });
            $("#myspindiv").hide();
        });
    </script>
</body>
</html>
