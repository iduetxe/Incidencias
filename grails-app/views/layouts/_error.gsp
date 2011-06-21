<div id="messages">
    <g:if test="${flash.message}">
        <g:each in="${flash.message}" var="message">
            <div class="message info">
                <button onclick="closeInfo(this);
                return false;">Cerrar</button>
                <p>${message}</p>
            </div>
        </g:each>

    </g:if>
    <g:if test="${flash.error}">
        <g:each in="${flash.error}" var="message">
            <div class="message error">
                <button onclick="closeInfo(this);
                return false;">Cerrar</button>
                <p>${message}</p>
            </div>
        </g:each>

    </g:if>
    <g:hasErrors>
        <g:eachError>
            <div class="message error">
                <button onclick="closeInfo(this);
                return false;">Cerrar</button>
                <p>${it.defaultMessage}</p>
            </div>
        </g:eachError>
    </g:hasErrors>



    <script>

        $(document).ready(function () {
            $("#messages").animate({
                height:200
            }, 1500);

            $('#messages').slideUp(1500).delay(1500);
        });

        function closeInfo(button) {
            $(button).parent(".message").hide();
        }

    </script>

</div>
