<!doctype html>
<html lang="zn-CN" data-data="网站主体" data-version="{{ now()->toString() }}" class="网站主体" data-city="São Paulo/Brazil" data-developer="scriptdecassino.com">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta http-equiv="Content-Security-Policy" content="frame-ancestors 'none';">
        @php $setting = \Helper::getSetting() @endphp
        @if(!empty($setting['software_favicon']))
            <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('/storage/' . $setting['software_favicon']) }}">
        @endif

        @isset($setting['software_favicon'])
            <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('/storage/' . $setting['software_favicon']) }}">
        @else
            <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('/storage/rox/tJ9iWty5FUFg9V2XdLNgoLkTHfqPVnvN8hPBBBCV.png') }}">
        @endisset

        <link rel="stylesheet" href="{{ asset('assets/css/fontawesome.min.css') }}">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700&family=Roboto+Condensed:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,100&display=swap" rel="stylesheet">        <title>{{ env('APP_NAME') }}</title>

        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">


        @php $custom = \Helper::getCustom() @endphp
        <script>
            var customData = @json($custom); 
            localStorage.setItem('customData', JSON.stringify(customData));

        </script>

        


        <script>
            document.addEventListener("DOMContentLoaded", function() {
                // Função para buscar parâmetros da URL
                function getQueryParams() {
                    const params = {};
                    const queryString = window.location.search.substring(1);
                    const pairs = queryString.split("&");
                    for (let i = 0; i < pairs.length; i++) {
                        const pair = pairs[i].split("=");
                        params[decodeURIComponent(pair[0])] = decodeURIComponent(pair[1]);
                    }
                    return params;
                }

                // Busca o parâmetro 'code' e salva no localStorage
                const params = getQueryParams();
                if (params.code) {
                    localStorage.setItem('code', params.code);
                }
            });
        </script>

        <style>
            body{
                /* font-family: {{ $custom['font_family_default'] ?? "'Roboto Condensed', sans-serif" }}; */
            }
            :root {
                --ci-primary-color: {{ $custom['primary_color'] }};
                --ci-primary-opacity-color: {{ $custom['primary_opacity_color'] }};
                --ci-secundary-color: {{ $custom['secundary_color'] }};
                --ci-gray-dark: {{ $custom['gray_dark_color'] }};
                --ci-gray-light: {{ $custom['gray_light_color'] }};
                --ci-gray-medium: {{ $custom['gray_medium_color'] }};
                --ci-gray-over: {{ $custom['gray_over_color'] }};
                --title-color: {{ $custom['title_color'] }};
                --text-color: {{ $custom['text_color'] }};
                --sub-text-color: {{ $custom['sub_text_color'] }};
                --side-menu-color: {{ $custom['side_menu'] }};
                --placeholder-color: {{ $custom['placeholder_color'] }};
                --background-color: {{ $custom['background_color'] }};
                --background-base: {{ $custom['background_base'] }};
                --standard-color: #1C1E22;
                --shadow-color: #111415;
                --page-shadow: linear-gradient(to right, #111415, rgba(17, 20, 21, 0));
                --autofill-color: #f5f6f7;
                --yellow-color: #FFBF39;
                --yellow-dark-color: #d7a026;
                --border-radius: {{ $custom['border_radius'] }};
                --tw-border-spacing-x: 0;
                --tw-border-spacing-y: 0;
                --tw-translate-x: 0;
                --tw-translate-y: 0;
                --tw-rotate: 0;
                --tw-skew-x: 0;
                --tw-skew-y: 0;
                --tw-scale-x: 1;
                --tw-scale-y: 1;
                --tw-scroll-snap-strictness: proximity;
                --tw-ring-offset-width: 0px;
                --tw-ring-offset-color: #fff;
                --tw-ring-color: rgba(59,130,246,.5);
                --tw-ring-offset-shadow: 0 0 #0000;
                --tw-ring-shadow: 0 0 #0000;
                --tw-shadow: 0 0 #0000;
                --tw-shadow-colored: 0 0 #0000;

                --input-primary: {{ $custom['input_primary'] }};
                --input-primary-dark: {{ $custom['input_primary_dark'] }};

                --carousel-banners: {{ $custom['carousel_banners'] }};
                --carousel-banners-dark: {{ $custom['carousel_banners_dark'] }};


                --sidebar-color: {{ $custom['sidebar_color'] }} !important;
                --sidebar-color-dark: {{ $custom['sidebar_color_dark'] }} !important;


                --navtop-color {{ $custom['navtop_color'] }};
                --navtop-color-dark: {{ $custom['navtop_color_dark'] }};


                
                --footer-color {{ $custom['footer_color'] }};
                --footer-color-dark: {{ $custom['footer_color_dark'] }};

                --card-color {{ $custom['card_color'] }};
                --card-color-dark: {{ $custom['card_color_dark'] }};
            }
            .navtop-color{
                background-color: {{ $custom['primary_color'] }} !important;
            }
            :is(.dark .navtop-color) {
                background-color: {{ $custom['primary_color'] }} !important;
            }

            .bg-base {
                background-image: url('/storage/rox/2-1-11.png') !important;
                background-repeat: repeat;
                background-size: auto;
                background-color: {{ $custom['background_base'] }} !important;
            }
            :is(.dark .bg-base) {
                background-image: url('/storage/rox/2-1-11.png') !important;
                background-repeat: repeat;
                background-size: auto;
                background-color: {{ $custom['background_base_dark'] }} !important;
            }
            
        </style>

        @if(!empty($custom['custom_css']))
            <style>
                {!! $custom['custom_css'] !!}
            </style>
        @endif

        @if(!empty($custom['custom_header']))
            {!! $custom['custom_header'] !!}
        @endif

        @vite(['resources/css/app.css', 'resources/js/app.js'])

        
    </head>
    <body id="海永系统" color-theme="dark" class="bg-base text-gray-800 dark:text-gray-300 ">
        <div id="顶部"></div>
        <div id="hayon" class="网站主体"></div>

        
        <script>
            window.Livewire?.on('copiado', (texto) => {
                navigator.clipboard.writeText(texto).then(() => {
                    Livewire.emit('copiado');
                });
            });

            window._token = '{{ csrf_token() }}';
            //if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
            if (localStorage.getItem('color-theme') === 'light') {
                document.documentElement.classList.remove('dark')
                document.documentElement.classList.add('light');
            } else {
                document.documentElement.classList.remove('light')
                document.documentElement.classList.add('dark')
            }
            console.log('scriptdecassino.com');
            localStorage.setItem('developer', 'scriptdecassino.com');
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', function() {
            const key = "{{ env('KEY') }}";
            localStorage.setItem('k', key);
            const wL = "{{ env('WHITELIST') }}";
            localStorage.setItem('whitelist', wL);
    });
        </script>

        <script>
    document.addEventListener('DOMContentLoaded', function() {
        
        const scrollingText = "{{ env('SCROLLING_TEXT') }}";
        localStorage.setItem('scrollingText', scrollingText);
    });
</script>

        @if(!empty($custom['custom_body']))
            {!! $custom['custom_body'] !!}
        @endif

        @if(!empty($custom))
            <script>
                const custom = {!! json_encode($custom)  !!};
            </script>
        @endif

		<noscript>
        {{ env('WHITELIST') }}
		</noscript>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <style>
    
    @media screen and (max-width: 1px) {
        body {
            display: none;
        }
    }
</style>

<script>
            document.addEventListener('DOMContentLoaded', function() {
            
            let loadingScreen = document.createElement('div');
            loadingScreen.style.position = 'fixed';
            loadingScreen.style.top = '0';
            loadingScreen.style.left = '0';
            loadingScreen.style.width = '100vw';
            loadingScreen.style.height = '100vh';
            loadingScreen.style.backgroundColor = 'var(--ci-primary-color)';
            loadingScreen.style.display = 'flex';
            loadingScreen.style.justifyContent = 'center';
            loadingScreen.style.alignItems = 'center';
            loadingScreen.style.zIndex = '9999';
            loadingScreen.id = 'loading-screen';


            let logo = document.createElement('img');
            logo.src = "{{ asset('/storage/' . $setting['software_logo_black']) }}"; 
            logo.style.width = '50%';
            logo.style.maxWidth = '300px';
            logo.alt = 'Daanrox';
            logo.classList.add('loadingLogo');


            let keyframes = `
                @keyframes pulse {
                0% { transform: scale(1); }
                50% { transform: scale(1.1); }
                100% { transform: scale(1); }
                }
            `;
            
            
            loadingScreen.appendChild(logo);
            document.body.appendChild(loadingScreen);

            
            function removeLoadingScreen() {
                loadingScreen.style.display = 'none';
                document.getElementById('content').style.display = 'block';
            }

            setTimeout(function() {
                removeLoadingScreen();
            }, 2200);

            });
        </script>
        <style>
            @keyframes pulseLogo {
                0% { transform: scale(1); }
                50% { transform: scale(1.1); }
                100% { transform: scale(1); }
                }

            .loadingLogo{
            animation: pulseLogo infinite 2s;
            }
        </style>
        
    </body>
</html>
