package incidencias

class AutocompleterTagLib {

    def loadAutocompleter = {
        out << """<script src="${resource(dir:'js/jquery-autocomplete-r3.2.2',file:'jquery.autocomplete.js')}"  type="text/javascript"></script>"""
        out << """<link rel="stylesheet" href="${resource(dir:'js/jquery-autocomplete-r3.2.2',file:'jquery.autocomplete.css')}" type="text/css"> </link>"""

    }

    def selectService = {attrs, body ->
        String inputName = attrs.name
        out << """ <input type='text' id='tagSuggest${inputName}' name='${inputName}'> </input>"""
        out << """
                <script>
                    \$("#tagSuggest${inputName}").autocomplete({
                       url:'${createLink(controller:"servicio", action:"listServicesJson")}',
                       showResult: function(value, data) {
                        var data = value.split(',')
                        var codigo = data[0]
                        var nombre = data[1]
                        var pabellon = data[2]
                        var planta = data[3]
                        var res = '<p style="text-transform:capitalize">' + nombre + '</p>';
                        res = res + '<div style="position:absolute;">'
                        res = res + '<p style="background:red;">'+pabellon+'</p>';
                        res = res + '</div>';
                        return res;

                       },
                        onItemSelect: function(item) {
                            var text =  item.value;
                            if (item.data.length) {
                                text += '<i>' + item.data.join(', ') + '</i>';
                            }
                            var li = '<li>'+text+'<input type="hidden" value="'+text+'" name="tags"/></li>';
                            \$("#listTagsSelected").append(li);
                        },
                        maxItemsToShow: 5
                    });
                </script>
                """
    }

}
