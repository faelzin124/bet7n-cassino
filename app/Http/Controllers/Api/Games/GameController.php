<?php

namespace App\Http\Controllers\Api\Games;

use App\Http\Controllers\Controller;
use App\Models\Game;
use App\Models\GameFavorite;
use App\Models\GameLike;
use App\Models\GamesKey;
use App\Models\Gateway;
use App\Models\Provider;
use App\Models\Wallet;
use App\Traits\Providers\ApiPragmatic40Trait;
use App\Traits\Providers\WizzeProTrait;
use Illuminate\Http\Request;
class GameController extends Controller
{
    use WizzeProTrait,
  		ApiPragmatic40Trait;

   
    public function index()
    {
        $providers = Provider::with(['games', 'games.provider'])
            ->whereHas('games')
            ->orderBy('name', 'desc')
            ->where('status', 1)
            ->get();

            return response()->json([
                'rox' => $providers,
                'false' => true
            ]);
    }
    //Hayon 2.0 Chines https://scriptdecassino.com
    public function featured()
    {
        $featured_games = Game::with(['provider'])
                    ->where('is_featured', 1)
                    ->where('status', 1)
                    ->get();

        return response()->json(['featured_games' => $featured_games]);
    }
    //Hayon 2.0 Chines https://scriptdecassino.com
    public function sourceProvider(Request $request, $token, $action)
    {
        $tokenOpen = \Helper::DecToken($token);
        $validEndpoints = ['session', 'icons', 'spin', 'freenum'];

        if (in_array($action, $validEndpoints)) {
            if(isset($tokenOpen['status']) && $tokenOpen['status'])
            {
                $game = Game::whereStatus(1)->where('game_code', $tokenOpen['game'])->first();
                if(!empty($game)) {
                    $controller = \Helper::createController($game->game_code);

                    switch ($action) {
                        case 'session':
                            return $controller->session($token);
                        case 'spin':
                            return $controller->spin($request, $token);
                        case 'freenum':
                            return $controller->freenum($request, $token);
                        case 'icons':
                            return $controller->icons();
                    }
                }
            }
        } else {
            return response()->json([], 500);
        }
    }
    //Hayon 2.0 Chines https://scriptdecassino.com
    public function toggleFavorite($id)
    {
        if(auth('api')->check()) {
            $checkExist = GameFavorite::where('user_id', auth('api')->id())->where('game_id', $id)->first();
            if(!empty($checkExist)) {
                if($checkExist->delete()) {
                    return response()->json(['status' => true, 'message' => 'Removido com sucesso']);
                }
            }else{
                $gameFavoriteCreate = GameFavorite::create([
                    'user_id' => auth('api')->id(),
                    'game_id' => $id
                ]);

                if($gameFavoriteCreate) {
                    return response()->json(['status' => true, 'message' => 'Criado com sucesso']);
                }
            }
        }
    }
    //Hayon 2.0 Chines https://scriptdecassino.com
    public function toggleLike($id)
    {
        if(auth('api')->check()) {
            $checkExist = GameLike::where('user_id', auth('api')->id())->where('game_id', $id)->first();
            if(!empty($checkExist)) {
                if($checkExist->delete()) {
                    return response()->json(['status' => true, 'message' => 'Removido com sucesso']);
                }
            }else{
                $gameLikeCreate = GameLike::create([
                    'user_id' => auth('api')->id(),
                    'game_id' => $id
                ]);

                if($gameLikeCreate) {
                    return response()->json(['status' => true, 'message' => 'Criado com sucesso']);
                }
            }
        }
    }
     //Hayon 2.0 Chines https://scriptdecassino.com

    public function show(string $id)
    {
        $game = Game::with(['categories', 'provider'])->whereStatus(1)->find($id);
        if(!empty($game)) {
            if(auth('api')->check()) {
                $wallet = Wallet::where('user_id', auth('api')->user()->id)->first();
                if($wallet->total_balance > 0 || $game->id == 1580) {
                    $game->increment('views');

                    $token = \Helper::MakeToken([
                        'id' => auth('api')->user()->id,
                        'game' => $game->game_code
                    ]);

                    switch ($game->distribution) {
 						case 'apipragmatic40':
                        $apiPragmatic40Launch = self::ApiPragmaticGameLaunch($game->provider->code, $game->game_id, 'pt', auth('api')->user()->email);
                        if(isset($apiPragmatic40Launch['launch_url'])) {
                            return response()->json([
                                'game' => $game,
                                'gameUrl' => $apiPragmatic40Launch['launch_url'],
                                'token' => $token
                            ]);
                        }
                        case 'wizzepro':
                            $wizzeproLaunch = self::GameLaunchWizzePro($game->provider->code, $game->game_id, 'pt', auth('api')->id());
                            
                            if(isset($wizzeproLaunch['launchUrl'])) {
                                return response()->json([
                                    'game' => $game,
                                    'gameUrl' => $wizzeproLaunch['launchUrl'],
                                ]);
                            } else {
                                return response()->json($wizzeproLaunch);
                            }
                    
                        return response()->json(['error' => $wizzeproLaunch, 'status' => false ], 400);
                        case 'source':
                            return response()->json([
                                'game' => $game,
                                'gameUrl' => url('/originals/'.$game->game_code.'/index.html?token='.$token),
                                'token' => $token
                            ]);
                       

                    }
                }
                return response()->json(['error' => 'Você precisa ter saldo para jogar', 'status' => false, 'action' => 'deposit' ], 200);
            }
            return response()->json(['error' => 'Você precisa tá autenticado para jogar', 'status' => false ], 400);
        }
        return response()->json(['error' => '', 'status' => false ], 400);
    }

    //Hayon 2.0 Chines https://scriptdecassino.com
    public function allGames(Request $request)
    {
        $query = Game::query();
        $query->with(['provider', 'categories']);

        if (!empty($request->provider) && $request->provider != 'all') {
            $query->where('provider_id', $request->provider);
        }

        if (!empty($request->category) && $request->category != 'all') {
            $query->whereHas('categories', function ($categoryQuery) use ($request) {
                $categoryQuery->where('slug', $request->category);
            });
        }

        if (isset($request->searchTerm) && !empty($request->searchTerm) && strlen($request->searchTerm) > 2) {
            $query->whereLike(['game_code', 'game_name', 'description', 'distribution', 'provider.name'], $request->searchTerm);
        }else{
            $query->orderBy('views', 'desc');
        }

        $games = $query
            ->where('status', 1)
            ->paginate(12)->appends(request()->query());

        return response()->json(['games' => $games]);
    }
    
    
    
    // WIZZE PRO API
    public function GoldApiMethodWizzePro(Request $request)
    {
        return self::WebhooksWizzePro($request);
    }
    public function UserBalanceMethodWizzePro(Request $request)
    {
        return self::GetUserBalanceWizzePro($request);
    }
    public function GameCallbackMethodWizzePro(Request $request)
    {
        return self::GameCallbackWizzePro($request);
    }
    public function MoneyCallbackMethodWizzePro(Request $request)
    {
        return self::MoneyCallbackWizzePro($request);
    }
    
    // API 40
    public function webhookApiPragmatic40(Request $request)
    {
        return self::ApiPragmaticWebhook($request);
    }
}
