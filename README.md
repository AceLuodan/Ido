# Ido

governance 函数(只允许管理者交互)

1.function setTimeOTffer(uint timeOffer_) public governance

2.function setTimeClaim(uint timeClaim_) public governance

3.function setRatio(uint ratio_) public governance

4.function setRecipient(address payable recipient_) public governance

5.function setQuota(address addr, uint amount_) public governance

6.function rescueTokens(address _token, address _dst) public governance

7.function withdrawToken(address _dst) external governance

8.function withdrawToken() external governance

9.function withdrawEth(address payable _dst) external governance

10.function withdrawEth() external governance



user 函数

写函数
1.function setQuotas(address[] calldata addrs, uint amount) external

2.function setQuotas(address[] calldata addrs, uint[] calldata amounts) external

3.function offer(uint amount_) external

4.function claim() public

读函数
1.function claimedOf(address add) public

2.function offeredOf(address add) public

3.function quotaOf(address add) public

4.function curreny() public

5.function token() public

6.function governor() public

7.function ratio() public

8.function timeClaim() public

9.function timeOffer() public

10.function recipient() public

11.function totalQuota() public

12.function totalOffered() public

13.function totalClaimed() public
