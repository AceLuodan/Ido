1. 测试网
    NetWork Name: OKExChain Testnet
    RPC URL:https://exchaintestrpc.okex.org
    Chain ID: 65
    Currency Symbol: OKT
    Block Explorer URL: https://www.oklink.com/okexchain-test/


    
    NetWork Name: OKExChain Mainnet
    RPC URL: https://exchainrpc.okex.org
    Chain ID: 66
    Currency Symbol: OKT
    Block Explorer URL: https://www.oklink.com/okexchain/




2.USDT 合约
0xe579156f9decc4134b5e3a30a24ac46bb8b01281
精度10

3.T合约
0xc5e96b3bcb700584ce108f30f118d406f3938403
精度18

4.管理者地址
0x66d59cA5721Ce058B706581d983bbD7c5bA366f1
83f14453333d28879b008258d9a24bf0409fc69699275198845edb2ae0fc00d6


5.测试账户
0x42D073B89f8854e6A7ce61F1583FA4A28d71BC0d

0x5fA4B253C9f20cccf021BCD8A501De998C0CBa41

6.IDO白名单合约
0x914b3211178137Ae6Acd862c79945e86Ca02406e
IDO一些属性说明

address governor_ 管理者地址

address currency_ USTD合约地址

address token_  代币合约地址

address payable recipient_  收款USDT地址

address payable feeOwner_  fee收款USDT地址

feeRatio_ 为整数  收费比例 3% 3*10**18(10000000000000000000)/100 =  30000000000000000
 
uint timeOffer_    s  开始IDO时间 1618827957
 
uint timeClaim_    s  开始申领代币时间  1618837657000

uint price_      (USDT:T) * 1e18  * 10**curDec / 10 ** tokenDec   
 
price_ 为整数  0.1*10**18(10000000000000000000)  1USDT = 10 T

minUsdtTotalOffered_ 10 USDT  10*10**USDT decimals 最低软顶，低于即失败 10000000

TOKEN(T) :  USDT: = 1：price_

minUsdtPersonOffered_ 1USDT（1*10**USDT decimals ）  个人最低USDT额度

1.合约初始化

2.发送 T Token  给 IDO合约

3.IDO合约设置用户USDT额度

4.用户approve 额度 给IDO合约

5.用户 offer  IDO合约

5.用户 claim  IDO合约


-----------------------------------------


2.IDO public-Sale合约
0x05127bD698b20ef4180D378962a5f5C82F132024
IDO一些属性说明

address governor_ 管理者地址

address currency_ USTD合约地址

address token_  代币合约地址

address payable recipient_  收款USDT地址

address payable feeOwner_  fee收款USDT地址

feeRatio_ 为整数  收费比例 3% 3*10**18(10000000000000000000)/100 =  30000000000000000
 
uint timeOffer_    s  开始IDO时间 1618827957
 
uint timeClaim_    s  开始申领代币时间  1618827657000

price_ 为整数  0.1*10**18(10000000000000000000)

minUsdtTotalOffered_ 10 USDT  10*10**USDT decimals 最低软顶，低于即失败 10000000

maxUsdtTotalOffered_  50000000 USDT 50000000*10**USDT decimals 硬顶  50000000000000

minUsdtPersonOffered_ 1USDT（1*10**USDT decimals ）  个人最低USDT额度
 
maxUsdtPersonOffered_ 1000USDT（1000*10**USDT decimals ） 个人最高USDT额度

TOKEN(T) :  USDT: = 1：price_


1.合约初始化(最低额度，price*t 数量)

2.发送 T Token  给 IDO合约

3.用户approve 额度 给IDO合约

4.用户 offer  IDO合约

5.用户 claim  IDO合约
