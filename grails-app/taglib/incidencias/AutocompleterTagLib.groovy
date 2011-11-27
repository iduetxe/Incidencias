package incidencias

class AutocompleterTagLib {

    def loadAutocompleter = {
        out << """<script src="${resource(dir:'js/jquery-autocomplete-r3.2.2',file:'jquery.autocomplete.js')}"  type="text/javascript"></script>"""
        out << """<link rel="stylesheet" href="${resource(dir:'js/jquery-autocomplete-r3.2.2',file:'jquery.autocomplete.css')}" type="text/css"> </link>"""

    }

    private String displayService(String inputName, String codigo, String name, String pabellon, String planta, boolean editable){
       def res = """
            <p id="codigo${inputName}" style="float:left;"> ${codigo}</p>
            <DIV class="extraDataServicio" ID="extraShowData${inputName}" style="position:absolute; display:none">
                   <p id="nombre${inputName}"> ${name}</p>
                   <p id="pabellon${inputName}"> ${pabellon} </p>
                   <p>Planta: <span id="planta${inputName}"> </span></p>
            </DIV>
            <script>
                function fixExtraData${inputName}(){
                    var top = \$('#codigo${inputName}').offset().top -16 -\$('#extraShowData${inputName}').height();
                    var left = \$('#codigo${inputName}').offset().left;
                    \$('#extraShowData${inputName}').css({top:top,left:left});
                }

                \$('#codigo${inputName}').mouseover(function (){
                    fixExtraData${inputName}()
                    \$('#extraShowData${inputName}').show();
                });
                \$('#codigo${inputName}').mouseout(function (){
                    \$('#extraShowData${inputName}').hide();
                });
           """
       if (editable){
           res +="""
                \$('#codigo${inputName}').click(function (){
                    \$("#tagSuggest${inputName}").show();
                    \$("#tagSuggest${inputName}").val("");
                    \$('#extraShowData${inputName}').hide();
                    \$('#codigo${inputName}').hide();
                });
                """
       }
        res +=
           """
                    </script>
           """

           res
    }

    def selectService = {attrs, body ->
        String inputName = attrs.name
        out << """ <input type='text' autocomplete = "off" id='tagSuggest${inputName}' name='${inputName}'> </input>"""
        out << displayService(inputName,"","","","",true);
        out << """
                <script>


                    \$("#tagSuggest${inputName}").autocomplete({
                       url:'${createLink(controller:"servicio", action:"listServicesJson")}',
                       showResult: function(value, data) {
                        var data = value.split(',');
                        var id = data[0]
                        var codigo = data[1];
                        var nombre = data[2];
                        var pabellon = data[3];
                        var planta = data[4];
                        var res = '<p class="servicioAutocomplete">' + nombre + '</p>';
                        res = res + '<div class="extraInfoAutoComplete">'
                        res = res + '   <p>'+pabellon+'</p>';
                        res = res + '   <p><i>Planta</i>'+planta+'</p>';
                        res = res + '</div>';
                        return res;
                       },
                        onItemSelect: function(item) {
                            var data = item.value.split(',');
                            var id = data[0];
                            var codigo = data[1];
                            var nombre = data[2];
                            var pabellon = data[3];
                            var planta = data[4];
                            \$("#tagSuggest${inputName}").hide();
                            \$("#codigo${inputName}").text(codigo);
                            \$("#nombre${inputName}").text(nombre);
                            \$("#pabellon${inputName}").text(pabellon);
                            \$("#planta${inputName}").text(planta);
                            \$("#${inputName}").val(id);
                            \$('#codigo${inputName}').show();
                            fixExtraData${inputName}();
                        },
                        maxItemsToShow: 5
                    });
                </script>
                """
    }

    def showServicio = {attrs, body ->

        String inputName = attrs.name
        String codigo = attrs.serviceCodigo
        String name = attrs.serviceName
        String pabellon = attrs.servicePabellon
        String planta = attrs.servicePlanta
        out << displayService(inputName,codigo,name,pabellon,planta,false);
    }
}
