1. CFX 测试网
   For the eSpace mainnet, please use the following configuration values:

Network Name: Conflux eSpace
New RPC URL: https://evm.confluxrpc.com
Chain ID: 1030
Currency Symbol: CFX
Block Explorer URL: https://evm.confluxscan.net
For the eSpace testnet, please use the following configuration values:

Network Name: Conflux eSpace (Testnet)
New RPC URL: https://evmtestnet.confluxrpc.com
Chain ID: 71
Currency Symbol: CFX
Block Explorer URL: https://evmtestnet.confluxscan.net

faucet：
https://efaucet.confluxnetwork.org/

2.CFX
0x0000000000000000000000000000000000000000
精度 18

3.T 合约（模拟 IDO 的代币合约）
0x671467E6E211be745D8FF41A5bC9740b4293892a
精度 18

4.管理者地址
0x9486C6F40cb91AA0880e22C707a6689A8Ec7688c
65723ac4ba622d2fc87849da77bba0ef7cbbbd1e0399a416e7349164d53e0128

5.测试账户

6.IDO 白名单合约
0x48B65bE9B893B2372bF2d9d41f849CF8FDf2239D
IDO 一些属性说明

address governor\_ 管理者地址

address currency\_ USTD 合约地址

address token\_ 代币合约地址

address payable recipient\_ 收款 USDT 地址

address payable feeOwner\_ fee 收款 USDT 地址

feeRatio\_ 为整数 收费比例 3% 3\*10\*\*18(10000000000000000000)/100 = 30000000000000000

uint timeOffer\_ s 开始 IDO 时间 1618827957

uint timeClaim\_ s 开始申领代币时间 1618837657000

uint price\_ (CFX:T) _ 1e18 _ 10**curDec / 10 ** tokenDec

price\_ 为整数 相当于 1CFX = 10 T

minUsdtTotalOffered\_ 10 USDT 10\*10\*\*USDT decimals 最低软顶，低于即失败 10000000

minUsdtPersonOffered\_ 1USDT（1\*10\*\*USDT decimals ） 个人最低 USDT 额度

1.合约初始化

2.发送 T Token 给 IDO 合约

3.IDO 合约设置用户 USDT 额度

4.用户 approve 额度 给 IDO 合约

5.用户 offer IDO 合约

5.用户 claim IDO 合约(支持 CFX，用户填入 CFX 数值，amount 为 0)

---

2.IDO public-Sale 合约
0x893910d7a0Af354D0aa368Ff777b155dDCAd7755
IDO 一些属性说明

address governor\_ 管理者地址

address currency\_ USTD 合约地址

address token\_ 代币合约地址

address payable recipient\_ 收款 USDT 地址

address payable feeOwner\_ fee 收款 USDT 地址

feeRatio\_ 为整数 收费比例 3% 3\*10\*\*18(10000000000000000000)/100 = 30000000000000000

uint timeOffer\_ s 开始 IDO 时间 1618827957

uint timeClaim\_ s 开始申领代币时间 1618827657000

price\_ 为整数 0.1\*10\*\*18(10000000000000000000)
price\_ 为整数 相当于 1CFX = 10 T

minUsdtTotalOffered\_ 10 USDT 10\*10\*\*USDT decimals 最低软顶，低于即失败 10000000

maxUsdtTotalOffered\_ 50000000 USDT 50000000\*10\*\*USDT decimals 硬顶 50000000000000

minUsdtPersonOffered\_ 1USDT（1\*10\*\*USDT decimals ） 个人最低 USDT 额度

maxUsdtPersonOffered\_ 1000USDT（1000\*10\*\*USDT decimals ） 个人最高 USDT 额度

1.合约初始化(最低额度，price\*t 数量)

2.发送 T Token 给 IDO 合约

3.用户 approve 额度 给 IDO 合约

4.用户 offer IDO 合约(支持 CFX，用户填入 CFX 数值，参数 amount 为 0)

5.用户 claim IDO 合约
