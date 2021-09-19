<?php

/**
 * Created by PhpStorm.
 * Waleed Bin Khalid
 * Date: 19/09/2021
 */

namespace App\Http\Controllers\SubAdmin;

use Illuminate\View\View;
use Illuminate\Http\Request;
use App\Helpers\GeneralHelper;
use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Redirector;
use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Contracts\View\Factory;
use App\Http\Contracts\IUserServiceContract;
use Illuminate\Contracts\Foundation\Application;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use App\Http\Contracts\ITransactionHistoryServiceContract;
use Illuminate\Contracts\Container\BindingResolutionException;

/**
 * Class DashboardController
 *
 * @package App\Http\Controllers
 */
class DashboardController extends Controller
{

    # Pages
    const DASHBOARD_PAGE = 'sub-admin.dashboard';

    /**
     * Interface IUserServiceContract
     *
     * @var IUserServiceContract
     */
    private $_userService;

    /**
     * Interface ITransactionHistoryServiceContract
     *
     * @var ITransactionHistoryServiceContract
     */
    private $_transactionService;

    /**
     * DashboardController constructor.
     *
     * @param IUserServiceContract $_userService
     * @param ITransactionHistoryServiceContract $_transactionService
     */
    public function __construct(
        IUserServiceContract $_userService,
        ITransactionHistoryServiceContract $_transactionService
    )
    {
        $this->_userService = $_userService;
        $this->_transactionService = $_transactionService;
    }

    /**
     * Sub Admin Dashboard
     */
    public function dashboard()
    {
        $userCount = $this->_userService->getAwaitingApprovalUsersCount();
        $withdrawalCount = $this->_transactionService->getWithdrawalRequestCount();
        return view(self::DASHBOARD_PAGE, compact('userCount', 'withdrawalCount'));
    }
}
