<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Tracker.UI.registration" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            margin-top: 20px;
            background: #f8f9fa;
        }

        .card {
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0px 6px 20px rgba(0,0,0,0.1);
        }

        .text-login {
            background: linear-gradient(135deg, #dbd4ff, #f2efff); /* light purple gradient */
            padding: 50px;
        }

        .btn-custom {
            background:#9c8de5; /*linear-gradient(90deg, #FFD54F, #FFB300);*/ /* yellow gradient */
            color: #fff;
            font-weight: 600;
            border: none;
            border-radius: 30px;
            width: 100%;
            padding: 12px;
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            opacity: 0.9;
        }

        .account-block {
            padding: 0;
            background-image: url('/Content/Images/bottles-cash-with-coins-saving-money-concept.jpg'); /* <-- yahan tumhari image lagao */
            background-repeat: no-repeat;
            background-size: cover;
            height: 100%;
            position: relative;
        }

        .account-block .overlay {
            flex: 1;
            position: absolute;
            top: 0; bottom: 0; left: 0; right: 0;
            background-color: rgba(0, 0, 0, 0.25);
        }

        .account-testimonial {
            text-align: center;
            color: #fff;
            position: absolute;
            bottom: 2rem;
            left: 0;
            right: 0;
        }

        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div id="main-wrapper" class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10">
                <div class="card">
                    <div class="row g-0">
                        <!-- Left Section -->
                        <div class="col-lg-6 text-login">
                            <h3 class="mb-4 text-dark">Create an account</h3>
                            <p class="text-muted mb-4">Sign in and get 30 day free trial</p>

                            <form id="form1" runat="server">
                                <div class="form-group mb-3">
                                    <asp:Label runat="server" AssociatedControlID="txtFullName" CssClass="form-label">Full Name</asp:Label>
                                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group mb-3">
                                    <asp:Label runat="server" AssociatedControlID="txtInputEmail1" CssClass="form-label">Email</asp:Label>
                                    <asp:TextBox ID="txtInputEmail1" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group mb-4">
                                    <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="form-label">Password</asp:Label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                </div>
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-custom mb-3" />
                                <div class="text-center">
                                    <button type="button" class="btn btn-light border rounded-pill px-4 me-2">Apple</button>
                                    <button type="button" class="btn btn-light border rounded-pill px-4">Google</button>
                                </div>
                            </form>

                            <p class="mt-4">Have an account? <a href="login.aspx">Sign in</a></p>
                            <a href="#" class="text-muted small">Terms & Conditions</a>
                        </div>

                        <!-- Right Section -->
                        <div class="col-lg-6 d-none d-lg-block">
                            <div class="account-block">
                                <div class="overlay"></div>
                                <div class="account-testimonial">
                                    <p class="lead">"Track your money"</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end card -->
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
