#pragma checksum "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "c703b5f7311cb8162dfb2573597c154eca81e78b"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Estudiante_Index), @"mvc.1.0.view", @"/Views/Estudiante/Index.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\_ViewImports.cshtml"
using LibraryManager;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\_ViewImports.cshtml"
using LibraryManager.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"c703b5f7311cb8162dfb2573597c154eca81e78b", @"/Views/Estudiante/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"5555c678da20d1a8acd4fdd8a50b59d95e62829e", @"/Views/_ViewImports.cshtml")]
    public class Views_Estudiante_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<IEnumerable<AspCoreModels.EstudianteModel>>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("asp-action", "Index", global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
  
    ViewData["Title"] = "Biblioteca Comunitaria";

#line default
#line hidden
#nullable disable
            WriteLiteral("<table class=\"table\">\r\n    <thead>\r\n        <tr>\r\n            <th>\r\n                ");
#nullable restore
#line 9 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
           Write(Html.DisplayNameFor(model => model.CI));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                ");
#nullable restore
#line 12 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
           Write(Html.DisplayNameFor(model => model.Nombre));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                ");
#nullable restore
#line 15 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
           Write(Html.DisplayNameFor(model => model.Apellido));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                ");
#nullable restore
#line 18 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
           Write(Html.DisplayNameFor(model => model.Direccion));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                ");
#nullable restore
#line 21 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
           Write(Html.DisplayNameFor(model => model.Edad));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th>\r\n                ");
#nullable restore
#line 24 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
           Write(Html.DisplayNameFor(model => model.Carrera));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </th>\r\n            <th></th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n");
#nullable restore
#line 30 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
         foreach (var Libro in Model)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("        <tr>\r\n            <td>\r\n                ");
#nullable restore
#line 34 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
           Write(Html.DisplayFor(modelItem => Libro.CI));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </td>\r\n            <td>\r\n                ");
#nullable restore
#line 37 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
           Write(Html.DisplayFor(modelItem => Libro.Nombre));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </td>\r\n            <td>\r\n                ");
#nullable restore
#line 40 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
           Write(Html.DisplayFor(modelItem => Libro.Apellido));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </td>\r\n            <td>\r\n                ");
#nullable restore
#line 43 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
           Write(Html.DisplayFor(modelItem => Libro.Direccion));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </td>\r\n            <td>\r\n                ");
#nullable restore
#line 46 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
           Write(Html.DisplayFor(modelItem => Libro.Edad));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </td>\r\n            <td>\r\n                ");
#nullable restore
#line 49 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
           Write(Html.DisplayFor(modelItem => Libro.Carrera));

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n            </td>\r\n            <td>\r\n                ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("a", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "c703b5f7311cb8162dfb2573597c154eca81e78b8580", async() => {
                WriteLiteral("Editar");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.Action = (string)__tagHelperAttribute_0.Value;
            __tagHelperExecutionContext.AddTagHelperAttribute(__tagHelperAttribute_0);
            if (__Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues == null)
            {
                throw new InvalidOperationException(InvalidTagHelperIndexerAssignment("asp-route-id", "Microsoft.AspNetCore.Mvc.TagHelpers.AnchorTagHelper", "RouteValues"));
            }
            BeginWriteTagHelperAttribute();
#nullable restore
#line 52 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
                                        WriteLiteral(Libro.IdLector);

#line default
#line hidden
#nullable disable
            __tagHelperStringValueBuffer = EndWriteTagHelperAttribute();
            __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues["id"] = __tagHelperStringValueBuffer;
            __tagHelperExecutionContext.AddTagHelperAttribute("asp-route-id", __Microsoft_AspNetCore_Mvc_TagHelpers_AnchorTagHelper.RouteValues["id"], global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral(" | \r\n            </td>\r\n        </tr>\r\n");
#nullable restore
#line 55 "C:\Users\BamopetLP\Documents\Trabajos\Consulting Group\Project\LibraryManager\LibraryManager\Views\Estudiante\Index.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </tbody>\r\n</table>");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<IEnumerable<AspCoreModels.EstudianteModel>> Html { get; private set; }
    }
}
#pragma warning restore 1591