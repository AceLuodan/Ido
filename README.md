Rinkeby测试网

USDT 合约
0x6d88d6d36B6B9F2FA216c0dB268bc6f93C6E829e

T合约
0x3cbcb0593b0deb9879350a338b9530781701a992
10000000000000000000000000000000

ower地址
0x66d59cA5721Ce058B706581d983bbD7c5bA366f1
83f14453333d28879b008258d9a24bf0409fc69699275198845edb2ae0fc00d6


测试账户
0x42D073B89f8854e6A7ce61F1583FA4A28d71BC0d

0x5fA4B253C9f20cccf021BCD8A501De998C0CBa41



IDO合约
0x1b116a9477cf8fc7bcd15676b2e996a3f94c79b9

address governor_ 管理者地址

address currency_ USTD合约地址

address token_  代币合约地址

address payable recipient_  收款USDT地址

address payable feeOwner_  fee收款USDT地址

feeRatio_ 为整数  收费比例 3% 3*10**18(10000000000000000000)/100 =  30000000000000000
 
uint timeOffer_    s  开始IDO时间 1618827957
 
uint timeClaim_    s  开始申领代币时间  1618827657000

ratio_ 为整数  10*10**18(10000000000000000000)

minTotalOffered_ 10 USDT  10*10**6 最低软顶，低于即失败 10000000

TOKEN(T) :  USDT: = 1：ratio_


1.合约初始化

2.发送 T Token  给 IDO合约

3.IDO合约设置USDT额度

4.用户approve 额度 给IDO合约

5.用户 offer  IDO合约

5.用户 claim  IDO合约
