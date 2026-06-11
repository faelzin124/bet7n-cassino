<?php

namespace App\Livewire;

use App\Models\AffiliateHistory;
use App\Models\Deposit;
use App\Models\User;
use App\Models\Wallet;
use App\Models\Withdrawal;
use Carbon\Carbon;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\Concerns\InteractsWithPageFilters;
use Illuminate\Support\Facades\DB;

class WalletOverview extends BaseWidget
{
    protected static ?int $sort = -2;
    use InteractsWithPageFilters;

    /**
     * @return array|Stat[]
     */
    protected function getStats(): array
    {
        $startDate = $this->filters['startDate'] ?? null;
        $endDate = $this->filters['endDate'] ?? null;

        $setting = \Helper::getSetting();
        $dataAtual = Carbon::now();
        $depositQuery = Deposit::query();
        $withdrawalQuery = Withdrawal::query();

        if (empty($startDate) && empty($endDate)) {
            $depositQuery->whereMonth('created_at', Carbon::now()->month);
        } else {
            $depositQuery->whereBetween('created_at', [$startDate, $endDate]);
        }

        // Executa a consulta para obter a soma dos depósitos para o mês atual
        $sumDepositMonth = $depositQuery
            ->where('status', 1)
            ->sum('amount');

        $withdrawalQuery->where('status', 1);

        if (empty($startDate) && empty($endDate)) {
            $withdrawalQuery->whereMonth('created_at', Carbon::now()->month);
        } else {
            $withdrawalQuery->whereBetween('created_at', [$startDate, $endDate]);
        }

        $sumWithdrawalMonth = $withdrawalQuery->sum('amount');
        $revshare = AffiliateHistory::where('commission_type', 'revshare')->sum('commission_paid');

        // Depósitos feitos hoje
        $depositsToday = Deposit::where('status', 1)
            ->whereDate('created_at', Carbon::today())
            ->sum('amount');

        // Total que os afiliados têm para saque (refer_rewards)
        $totalAffiliateWithdrawable = Wallet::sum('refer_rewards');

        // Depósito total vindo dos afiliados
        $totalDepositsFromAffiliates = AffiliateHistory::sum('deposited_amount');

        // Total de pessoas que depositaram mais de uma vez
        $multipleDepositors = Deposit::where('status', 1)
            ->select('user_id')
            ->groupBy('user_id')
            ->havingRaw('COUNT(*) > 1')
            ->get()
            ->count();

        // Valor total de depósitos na semana
        $totalDepositsThisWeek = Deposit::where('status', 1)
            ->whereBetween('created_at', [Carbon::now()->startOfWeek(), Carbon::now()->endOfWeek()])
            ->sum('amount');

        // Obter os 4 afiliados com mais depositantes
        $topAffiliates = AffiliateHistory::whereHas('user.deposits', function ($query) {
                $query->where('status', 1);  // Apenas depósitos confirmados
            })
            ->select('inviter', DB::raw('COUNT(DISTINCT user_id) as total_depositors'))
            ->groupBy('inviter')
            ->orderBy('total_depositors', 'desc')
            ->limit(4)
            ->get();

        // Nomes e totais dos top 4 afiliados
        $topAffiliateStats = [];
        foreach ($topAffiliates as $affiliate) {
            $user = User::find($affiliate->inviter);
            $topAffiliateStats[] = [
                'name' => $user?->name ?? 'N/A',
                'total_depositors' => $affiliate->total_depositors,
            ];
        }

        return [
            Stat::make('Depósitos', \Helper::amountFormatDecimal($sumDepositMonth))
                ->description('Total de Depósitos')
                ->descriptionIcon('heroicon-o-user-group')
                ->color('teal')
                ->chart([25, 35, 30, 40, 45, 55, 60])
                ->chartColor('rgba(20, 184, 166, 0.5)'),
            Stat::make('Saques', \Helper::amountFormatDecimal($sumWithdrawalMonth))
                ->description('Total de saques')
                ->descriptionIcon('heroicon-o-user-group')
                ->color('teal')
                ->chart([25, 35, 30, 40, 45, 55, 60])
                ->chartColor('rgba(20, 184, 166, 0.5)'),

            // Afiliado top 1
            Stat::make('Top 1 Afiliado', $topAffiliateStats[0]['name'] ?? '0')
                ->description(($topAffiliateStats[0]['total_depositors'] ?? 0) . ' pessoas indicadas')
                ->descriptionIcon('heroicon-o-user-group')
                ->color('green'),

            // Afiliado top 2
            Stat::make('Top 2 Afiliado', $topAffiliateStats[1]['name'] ?? '0')
                ->description(($topAffiliateStats[1]['total_depositors'] ?? 0) . ' pessoas indicadas')
                ->descriptionIcon('heroicon-o-user-group')
                ->color('blue'),

            // Afiliado top 3
            Stat::make('Top 3 Afiliado', $topAffiliateStats[2]['name'] ?? '0')
                ->description(($topAffiliateStats[2]['total_depositors'] ?? 0) . ' pessoas indicadas')
                ->descriptionIcon('heroicon-o-user-group')
                ->color('purple'),

            // Afiliado top 4
            Stat::make('Top 4 Afiliado', $topAffiliateStats[3]['name'] ?? '0')
                ->description(($topAffiliateStats[3]['total_depositors'] ?? 0) . ' pessoas indicadas')
                ->descriptionIcon('heroicon-o-user-group')
                ->color('orange'),
        ];
    }

    /**
     * @return bool
     */
    public static function canView(): bool
    {
        return auth()->user()->hasRole('admin');
    }
}
