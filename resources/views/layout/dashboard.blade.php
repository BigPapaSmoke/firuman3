<?php

use App\Classes\Hook;
use App\Classes\Output;
use App\Services\DateService;
use App\Services\Helper;
use App\Services\MenuService;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Auth;

/**
 * @var MenuService $menus
 */
$menus  =   app()->make( MenuService::class );

/**
 * @var MenuService $menus
 */
$dateService  =   app()->make( DateService::class );

if ( Auth::check() ) {
    $theme  =   Auth::user()->attribute->theme ?: ns()->option->get( 'ns_default_theme', 'light' );
} else {
    $theme  =   ns()->option->get( 'ns_default_theme', 'light' );
}
?>
<!DOCTYPE html>
<html lang="en" class="{{ $theme }}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{!! Helper::pageTitle( $title ?? __( 'Unamed Page' ) ) !!}</title>
    <?php 
        $output     =   new Output;
        Hook::action( "ns-dashboard-header", $output );
        echo ( string ) $output;
    ?>
    @vite([
        'resources/scss/line-awesome/1.3.0/scss/line-awesome.scss',
        'resources/scss/grid.scss',
        'resources/scss/fonts.scss',
        'resources/scss/animations.scss',
        'resources/scss/typography.scss',
        'resources/scss/app.scss',
        'resources/scss/' . $theme . '.scss'
    ])
    @yield( 'layout.dashboard.header' )
    <script>
        /**
         * constant where is registered
         * global custom components
         * @param {Object}
         */
        window.nsExtraComponents     =   new Object;

        /**
         * describe a global NexoPOS object
         * @param {object} ns
         */
        window.ns   =   { nsExtraComponents };

        /**
         * store the server date
         * @param {string}
         */
        window.ns.date  =   {
            current : '{{ app()->make( DateService::class )->toDateTimeString() }}',
            serverDate : '{{ app()->make( DateService::class )->toDateTimeString() }}',
            timeZone: '{{ ns()->option->get( "ns_datetime_timezone", "Europe/London" ) }}',
            format: `{{ $dateService->convertFormatToMomment( ns()->option->get( 'ns_datetime_format', 'Y-m-d H:i:s' ) ) }}`
        }

        /**
         * Let's define the actul theme used
         */
        window.ns.theme     =   `{{ $theme }}`;

        /**
         * define the current language selected by the user or
         * the language that applies to the system by default.
         */
        window.ns.language      =   '{{ app()->getLocale() }}';
        window.ns.langFiles     =   <?php echo json_encode( Hook::filter( 'ns.langFiles', [
            'NexoPOS'   =>  asset( "/lang/" . app()->getLocale() . ".json" ),
        ]));?>

        /**
         * We display only fillable values for the
         * logged user. The password might be displayed on an encrypted form.
         */
        window.ns.user              =   <?php echo json_encode( ns()->getUserDetails() );?>;
        window.ns.user.attributes   =   <?php echo json_encode( Auth::user()->attribute->first() );?>;
        window.ns.cssFiles          =   <?php echo json_encode( ns()->simplifyManifest() );?>;

        /**
         * We'll store here the file mime types
         * that are supported by the media manager.
         */
        window.ns.medias            =   {
            mimes:  <?php echo json_encode( ns()->mediaService->getMimes() )?>,
            imageMimes: <?php echo json_encode( ns()->mediaService->getImageMimes() );?>
        }
    </script>
    @vite([ 'resources/ts/lang-loader.ts' ])

<meta name="csrf-token" content="{{ csrf_token() }}">
   
</head>
<body <?php echo in_array( app()->getLocale(), config( 'nexopos.rtl-languages' ) ) ? 'dir="rtl"' : "";?>>
    <div class="h-full w-full flex flex-col">
        <div class="overflow-hidden flex flex-auto">
            <div id="dashboard-aside">
                <div v-if="sidebar === 'visible'" v-cloak  class="w-64 z-50 absolute md:static flex-shrink-0 h-full flex-col overflow-hidden">
                    <div class="ns-scrollbar overflow-y-auto h-full text-sm">
                        <div class="logo py-4 flex justify-center items-center">
                            @if ( ns()->option->get( 'ns_store_rectangle_logo' ) )
                            <img src="{{ ns()->option->get( 'ns_store_rectangle_logo' ) }}" class="w-11/12" alt="logo"/>
                            @else
                            <h1 class="font-black text-transparent bg-clip-text bg-gradient-to-b from-orange-400 to-red-500 text-3xl">Firuman</h1>
                            @endif
                        </div>
                        <ul>
                            @foreach( $menus->getMenus() as $identifier => $menu )
                                <ns-menu identifier="{{ $identifier }}" toggled="{{ $menu[ 'toggled' ] ?? '' }}" label="{{ @$menu[ 'label' ] }}" icon="{{ @$menu[ 'icon' ] }}" href="{{ @$menu[ 'href' ] }}" notification="{{ isset( $menu[ 'notification' ] ) ? $menu[ 'notification' ] : 0 }}" id="menu-{{ $identifier }}">
                                    @if ( isset( $menu[ 'childrens' ] ) )
                                        @foreach( $menu[ 'childrens' ] as $identifier => $menu )
                                        <ns-submenu :active="{{ ( isset( $menu[ 'active' ] ) ? ( $menu[ 'active' ] ? 'true' : 'false' ) : 'false' ) }}" href="{{ $menu[ 'href' ] }}" id="submenu-{{ $identifier }}">{{ $menu[ 'label' ] }}</ns-submenu>
                                        @endforeach        
                                    @endif
                                </ns-menu>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
            <div id="dashboard-overlay">
                <div v-if="sidebar === 'visible'" @click="closeMenu()" class="z-40 w-full h-full md:hidden absolute" style="background: rgb(51 51 51 / 25%)"></div>
            </div>
            <div id="dashboard-body" class="flex flex-auto flex-col overflow-hidden">
                <div class="overflow-y-auto flex-auto">
                    @hasSection( 'layout.dashboard.body' )
                        @yield( 'layout.dashboard.body' )
                    @endif

                    @hasSection( 'layout.dashboard.body.with-header' )
                        @include( 'common.dashboard.with-header' )
                    @endif

                    @hasSection( 'layout.dashboard.with-header' )
                        @include( 'common.dashboard.with-header' )
                    @endif

                    @hasSection( 'layout.dashboard.body.with-title' )
                        @include( 'common.dashboard.with-title' )
                    @endif

                    @hasSection( 'layout.dashboard.with-title' )
                        @include( 'common.dashboard.with-title' )
                    @endif
                </div>
<!-- Firuman footer -->
                <footer class="firuman-dashboard-footer" style="font-family: Arial, sans-serif; font-size: 14px; width: 100%; display: flex; align-items: center; justify-content: center; gap: 16px; padding: 12px 0; background-color: #1f2937; color: #d1d5db; border-top: 1px solid #374151;">
                    <span style="display: flex; align-items: center; gap: 6px;">
                        © 2025 Firuman
                        <svg width="20" height="20" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg" style="vertical-align: middle;">
                            <path fill="#FF4500" d="M32 2C32 2 10 22 10 39C10 53 22 62 32 62C42 62 54 53 54 39C54 22 32 2 32 2Z"/>
                            <path fill="#FF6347" d="M32 14C32 14 19 26 19 38C19 45 25 51 32 51C39 51 45 45 45 38C45 26 32 14 32 14Z"/>
                        </svg>
                        No Bloat. No Noise. Just Firuman.
                    </span>
                    <span style="margin-left: 16px;">| Powered by <a href="https://nexopos.com" target="_blank" rel="noopener noreferrer" style="color: #60a5fa; text-decoration: none; transition: color 0.2s;">NexoPOS</a></span>
                    
                    <!-- SALES REPORT BUTTON -->
                    <form method="POST" action="/send-sales-report" style="margin-left: 16px; display: inline;">
                        @csrf
                        <button type="submit" style="background: #FF4500; color: white; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; font-size: 12px; transition: background-color 0.2s; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);" onmouseover="this.style.backgroundColor='#e63e00'" onmouseout="this.style.backgroundColor='#FF4500'">
                            📧 Send Sales Report
                        </button>
                    </form>
                </footer>
            </div>
        </div>
    </div>
    @section( 'layout.dashboard.footer' )
        @include( 'common.popups' )
        @include( 'common.dashboard-footer' )
        @vite([ 'resources/ts/app.ts' ])
    @show

    </body>
</body>
</html>
