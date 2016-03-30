<%@ Page MaintainScrollPositionOnPostback="true" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/includes/header.ascx" TagPrefix="uc1" TagName="header" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BVM International School |Through the looking Glass-Future of Learning | </title>
    <meta content="International schools in Chennai,,International school Chennai,top international schools in Chennai,best international school in Chennai, 
          international schools in chennai omr."
        name="keywords" />
    <meta content="Register for Through the looking Glass-Future of Learning." name="description" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalbale=no" />
    <link href="css/reset.css" rel="stylesheet" />
    <link href="css/zerogrid.css" rel="stylesheet" />
    <link href="css/StyleSheet-inner.css" rel="stylesheet" type="text/css" />
    <link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700' rel='stylesheet' type='text/css' />
    <link href="images/favicon.png" rel="shortcut icon" />

</head>
<body>
    <div class="zerogrid">
        <form id="formMain" runat="server">

            <uc1:header runat="server" ID="header" />


            <!--Slider start-->

            <div class="row">
                <div class="banner">
                    <img src="images/bannerseminar.jpg" alt="" />
                </div>
            </div>

            <!--Slider End-->
            <!--section-->
            <div class="row">
                <div class="wrap-col section">
                    <div class="col-full">
                        <div class="breadcrumbs">
                            <div class="left-s">
                                <a href="home.aspx" class="breadcrumb-nav">
                                    <img src="images/home-icon.png" alt=""/></a>
                            </div>


                            <!--<ul>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Mission</a></li>
                        </ul>-->
                        </div>
                        <div class="content">


                            <div class="col-full">
                                <div class="joinus">
                                    <div class="maintitle">
                                        <h3 class="title-inner">Invitation</h3>
                                        <h4 class="seminarReg">Seminar Registration</h4>
                                    </div>
                                    <div class="invitation">
                                        <span class="invitationImg">
                                            <img src="images/invitation.jpg" alt="" /></span>

                                        <div class="maintitle freeReg">
                                            <h3 class="title-inner">FREE - SEMINAR REGISTRATION - 2016</h3>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="forms">

                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>



                                                    <div class="seminar-form">
                                                        <p>
                                                            <span>Class in which admission is sought</span> <b>: <span style="color: red; font-size: 19px;">*</span></b>
                                                        </p>
                                                        <span>

                                                            <asp:GridView ID="grid" GridLines="None" runat="server" AutoGenerateColumns="false" ShowHeader="false" ShowFooter="false" EnableViewState="true" OnRowDeleting="grid_RowDeleting"
                                                                OnRowDataBound="grid_RowDataBound" CssClass="gridstyle">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:DropDownList ID="ddlClass" runat="server" CssClass="txtsemselect" >
                                                                            </asp:DropDownList><br />
                                                                            <asp:RequiredFieldValidator ID="rfvClass" runat="server" ControlToValidate="ddlClass" ValidationGroup="seminar" ErrorMessage="Select Child class." SetFocusOnError="true" ForeColor="Red" Display="Dynamic" InitialValue="Select Class"></asp:RequiredFieldValidator>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" CssClass="Deletebtn" ValidationGroup="nones" Text="x">                                
                                                                            </asp:LinkButton>
                                                                            <%--<asp:Button ID="btnAdd" runat="server" Text="+" CssClass="intbtn" OnClick="btnAdd_Click" ValidationGroup="None" />--%>
                                                                        </ItemTemplate>

                                                                        <FooterTemplate>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:Button ID="btnAddNew" runat="server" CssClass="intbtn2" Text="+" Style="float: left" OnClick="btnAdd_Click" CausesValidation="false" />
                                                        </span>
                                                    </div>
                                                         <div class="clearfix"></div>


                                                    <div class="seminar-form">
                                                        <p>
                                                            <span>Fathers Name</span> <b>: <span style="color: red; font-size: 19px;">*</span></b>

                                                        </p>
                                                        <p>
                                                            <%--<input type="text" placeholder="" class="txtsem" />--%>
                                                            <asp:TextBox ID="txtFatherName" runat="server" CssClass="txtsem"></asp:TextBox><br />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="seminar" runat="server" Display="Dynamic" ErrorMessage="Enter Father name." ControlToValidate="txtFatherName" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="seminar" runat="server" Display="Dynamic" ErrorMessage="Only alphabets(Min 3 Characters)." ForeColor="Red" ValidationExpression="^[A-Za-z .]{3,}$" ControlToValidate="txtFatherName"></asp:RegularExpressionValidator>
                                                        </p>
                                                    </div>
                                                         <div class="clearfix"></div>
                                                    <div class="seminar-form">
                                                        <p>
                                                            <span>Mobile Number</span> <b>: <span style="color: red; font-size: 19px;">*</span></b>
                                                        </p>
                                                        <p>
                                                            <%--<input type="text" placeholder="" class="txtsem" />--%>
                                                            <asp:TextBox ID="txtFatherMobile" runat="server" CssClass="txtsem"></asp:TextBox><br />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="seminar" runat="server" ErrorMessage="Enter Mobile No." Display="Dynamic" ControlToValidate="txtFatherMobile" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="seminar" runat="server" Display="Dynamic" ErrorMessage="Only numbers(10 Digits)." ForeColor="Red" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtFatherMobile"></asp:RegularExpressionValidator>
                                                        </p>
                                                    </div>
                                                         <div class="clearfix"></div>
                                                    <div class="seminar-form">
                                                        <p>
                                                            <span>Email Id</span> <b>: <span style="color: red; font-size: 19px;">*</span></b>
                                                        </p>
                                                        <p>
                                                            <%--<input type="text" placeholder="" class="txtsem" />--%>
                                                            <asp:TextBox ID="txtFatherEmail" runat="server" CssClass="txtsem"></asp:TextBox><br />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="seminar" runat="server" Display="Dynamic" ErrorMessage="Enter Email-Id." ControlToValidate="txtFatherEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationGroup="seminar" runat="server" Display="Dynamic" ErrorMessage="Invalid Email format." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtFatherEmail"></asp:RegularExpressionValidator>
                                                        </p>
                                                    </div>
                                                         <div class="clearfix"></div>
                                                    <div class="seminar-form">
                                                        <p>
                                                            <span>Mother Name</span> <b>: <span style="color: red; font-size: 19px;">*</span></b>
                                                        </p>
                                                        <p>
                                                            <%--<input type="text" placeholder="" class="txtsem" />--%>
                                                            <asp:TextBox ID="txtMotherName" runat="server" CssClass="txtsem"></asp:TextBox><br />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="seminar" runat="server" Display="Dynamic" ErrorMessage="Enter Mother name." ControlToValidate="txtMotherName" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationGroup="seminar" runat="server" Display="Dynamic" ErrorMessage="Only alphabets(Min 3 Characters)." ForeColor="Red" ValidationExpression="^[A-Za-z .]{3,}$" ControlToValidate="txtMotherName"></asp:RegularExpressionValidator>
                                                        </p>
                                                    </div>
                                                         <div class="clearfix"></div>
                                                    <div class="seminar-form">
                                                        <p>
                                                            <span>Mobile Number</span> <b>: <span style="color: red; font-size: 19px;">*</span></b>
                                                        </p>
                                                        <p>
                                                            <%--<input type="text" placeholder="" class="txtsem" />--%>
                                                            <asp:TextBox ID="txtMotherMobile" runat="server" CssClass="txtsem"></asp:TextBox><br />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="seminar" runat="server" Display="Dynamic" ErrorMessage="Enter Mobile No." ControlToValidate="txtMotherMobile" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationGroup="seminar" runat="server" Display="Dynamic" ErrorMessage="Only numbers(10 Digits)." ForeColor="Red" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMotherMobile"></asp:RegularExpressionValidator>
                                                        </p>
                                                    </div>
                                                         <div class="clearfix"></div>
                                                    <div class="seminar-form">
                                                        <p>
                                                            <span>Email Id</span> <b>: <span style="color: red; font-size: 19px;">*</span></b>
                                                        </p>
                                                        <p>
                                                            <%--<input type="text" placeholder="" class="txtsem" />--%>
                                                            <asp:TextBox ID="txtMotherEmail" runat="server" CssClass="txtsem"></asp:TextBox><br />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="seminar" runat="server" Display="Dynamic" ErrorMessage="Enter Email-Id." ControlToValidate="txtMotherEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ValidationGroup="seminar" runat="server" Display="Dynamic" ErrorMessage="Invalid Email format." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtMotherEmail"></asp:RegularExpressionValidator>
                                                        </p>
                                                    </div>
                                                         <div class="clearfix"></div>

                                                    <div class="seminar-form">
                                                        <p>
                                                            <span>Please Enter This</span> <b>: <span style="color: red; font-size: 19px;">*</span></b>
                                                        </p>
                                                        <p>
                                                            <asp:Label ID="lblCaptcha" runat="server" CssClass="input-txtd" Text="34Ffd" ForeColor="Black" Font-Size="23px"></asp:Label><br />
                                                            <asp:TextBox ID="txtCaptcha" runat="server" CssClass="txtsem" MaxLength="6" AutoCompleteType="None" autocompletemode="off" placeholder="Enter above text here(No case sensitive)"></asp:TextBox><br />
                                                            <asp:Label ID="lblCaptchaError" runat="server" Visible="false" Text="Invalid, Please enter above text" ForeColor="red"></asp:Label>
                                                        </p>

                                                    </div>
                                                         <div class="clearfix"></div>

                                                    <div class="seminar-form">
                                                        <p>&nbsp;</p>
                                                        <p>                                                          
                                                            <asp:Button ID="btnSubmit" runat="server" CssClass="txtReg" Text="Register" ValidationGroup="seminar" CausesValidation="true" OnClick="btnSubmit_Click" />
                                                            <asp:Label ID="lblIPAddress" runat="server" Text="" CssClass="ipStyle"></asp:Label>
                                                        </p>
                                                    </div>


                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="btnSubmit" />
                                                </Triggers>
                                            </asp:UpdatePanel>

                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                        <div class="social-media">
                            <ul>
                            <li><a href="http://www.facebook.com/BVM-International-672506946185881" target="_blank"></a></li>
                                <!--<li><a href="#" class="tw"></a></li>-->
                                <li><a href="https://www.youtube.com/channel/UC7Jhe8N9Eo7BHcEexrjq_VQ" target="_blank" class="tube"></a></li>
                                <!--<li><a href="#" class="plus"></a></li>-->

                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <!--section end-->
            <!--footer start-->
            <div class="row footer">
                <div class="wrap-col">
                    <div class="col-full">

                        <div class="mail">
                            <p class="update">
                                <img src="images/mail.png" alt="" />
                                <span>Stay updated with BVMI</span>
                            </p>
                            <p class="label-txt">

                                <input type="text" id="txtMailInfo" runat="server" class="txt-input" placeholder="Enter Your Mail Id" />
                                <%--<input type="submit" value="" class="btnSubmit"  runat="server" onclick="btnSubmitMail_Click" />--%>
                                <asp:Button ID="btnSubmitMail" runat="server" Text=" " CausesValidation="false" CssClass="btnSubmit" OnClick="btnSubmitMail_Click" />

                            </p>
                        </div>

                        <div class="touch">
                            <p>
                                Get In Touch  &nbsp; &nbsp; +91 95000 58737 &nbsp; &nbsp; info@bvminternational.org
                            </p>

                        </div>


                    </div>
                </div>
            </div>
            <!--sectionfooter-->
            <div class="row sectionfooter">
                <div class="wrap-col">
                    <div class="col-full">
                        <div class="col-1-3">
                            <div class="bottomnavigation">
                                <h4 class="footer-title">Know Us</h4>
                                <div class="bottom-top">

                                    <p>
                                        The BVM i story began with a dream of establishing a 21st century International curriculum school for students of all nationalities, designed to prepare happy, healthy and well-rounded students.
                                   
                                    </p>
                                </div>

                            </div>
                        </div>
                        <div class="col-1-3">
                            <div class="bottomnavigation">
                                <h4 class="footer-title">Quick Links</h4>
                                <div class="bottom-top">
                                    <ul>
                                        <li><a href="whyBVMInternationalcurriculumschool.aspx">Why BVM International Curriculum School ?</a></li>
                                        <li><a href="whyinternationalgcse.aspx">Why International GCSE ?</a></li>
                                        <li><a href="internationalpreprimarycurriculum.aspx">International Pre Primary Curriculum - Pre KG, LKG & UKG </a></li>
                                        <li><a href="internationalprimarycurriculum.aspx">International Primary Curriculum - Grade 1 to 5 </a></li>
                                        <li><a href="internationallowersecondarycurriculum.aspx">International Lower Secondary Curriculum - grades 6 to 8 </a></li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-1-3">
                            <div class="bottomnavigation">
                                <h4 class="footer-title">Quick Query </h4>
                                <div class="bottom-top">
                                    <label>
                                        <input id="txtName" type="text" runat="server" placeholder="Name" class="txtname2" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="footerquery" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ValidationGroup="footerquery" Display="Dynamic" ErrorMessage="Only Alphabets(Min 3 Characters)." ForeColor="Red" ValidationExpression="^[A-Za-z .]{3,}$" ControlToValidate="txtName"></asp:RegularExpressionValidator>
                                    </label>
                                    <label>
                                        <%--<input type="text" placeholder="Mobile Number" class="txtmob" />--%>
                                        <input id="txtMobile" type="text" runat="server" placeholder="Mobile" class="txtmob" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="footerquery" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMobile"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ValidationGroup="footerquery" Display="Dynamic" ErrorMessage="Only Numbers(10 digits)." ForeColor="Red" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                                    </label>
                                    <label>
                                        <%--<input type="text" placeholder="E-mail" class="txtmail" />--%>
                                        <input id="txtEmail" type="text" runat="server" placeholder="Email" class="txtmail" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="footerquery" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ValidationGroup="footerquery" Display="Dynamic" ErrorMessage="Invalid email format." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                                        <br />
                                    </label>
                                    <label>
                                        <%--<textarea rows="5" placeholder="Messages"></textarea>--%>
                                        <textarea id="txtMessage" runat="server" rows="5" aria-multiline="true" placeholder="Message(min 15 characters)"></textarea>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="footerquery" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMessage"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ValidationGroup="footerquery" Display="Dynamic" ErrorMessage="Special characters not allowed(Max 300)." ForeColor="Red" ValidationExpression="^[A-Za-z0-9 .]{10,500}$" ControlToValidate="txtMessage"></asp:RegularExpressionValidator>
                                    </label>
                                    <label>
                                        <%--<input type="submit" value="submit" />--%>
                                        <asp:Button ID="btnSubmitQuery" runat="server" CssClass="txtbtn" Text="Submit" ValidationGroup="footerquery" OnClick="btnSubmitQuery_Click" />
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End-->
            <div class="row footer-end">
                <div class="wrap-col">
                    <div class="col-full">
                        <div class="col-1-2">
                            <p class="copy">Copyright &copy; 2016 BVM International</p>
                        </div>
                        <div class="col-1-2">
                            <a href="http://parampriti.com" target="_blank" class="bvm-footer">Parampriti</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--footer end-->
        </form>
    </div>
</body>
</html>

<script src="engine1/jquery.js"></script>
<script>
    $(document).ready(function () {

        window.addEventListener('resize', resizeWindow);
        $(".seminarReg").click(function () {
            var posToScroll = $(".freeReg").first().offset().top;
            $("html,body").animate({ scrollTop: posToScroll }, 400);
        });


        $("#menuclick").click(function () {
            $('.menu').slideToggle();
        });
        $(".menu ul li").click(function () {
            $(this).children('ul').slideToggle();
        })

    });
    function resizeWindow() {
        $(".seminarReg").click(function () {
            var posToScroll = $(".freeReg").first().offset().top;
            $("html,body").animate({ scrollTop: posToScroll }, 400);
        })
    }
</script>
