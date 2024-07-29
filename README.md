# R 語言教學 (2024 夏)

* 為什麼要寫程式？
* 為什麼要寫R？
* R基礎教學：
	+ 語法
	+ 機率與統計
	+ 資料
	+ 基礎統計分析

## 程式語言真的需要學嗎？

   程式語言作為這個世代最重要的跨領域工具之一，編寫程式的能力真的這麼重要嗎？隨著ChatGPT和Gemini等人工智慧的出現，就算是完全沒接觸過的人也可以輕鬆寫出幾百行程式碼、並順利跑出想要的結果。單單依靠自然語言就可以讓AI知道我們的需求。那麼，「會寫程式」真的重要嗎？我的答案是肯定的，而且非常重要！雖然我們的需求或能力並不需要和工程師或開發人員一樣優秀，但至少程式中的原理、邏輯、基本概念，還是有必要學習的。

   以最近使用ChatGPT來協助我寫程式的成果來說，很多時候必須稍稍將它寫出來的程式碼修正才能正常運行，但是我相信再過不久，會漸漸消失。現階段，「會寫程式」再加上「會使用人工智慧」可以解決大多數的問題。除了人生難題或是戀愛感情這種錯中複雜的問題「不一定」能得到想要的答案之外，文書處理、程式碼編譯、翻譯等等問題確實可以輕鬆完成。

   思考到底需不需要會寫程式？我認為還是重要的，舉個例子，假如我是個完全不會講英文的學生，隻身一人來到英語系國家旅遊時，我可以單單依靠一支有網路的手機幫我翻譯、解決所有溝通相關的問題。我們還需要好好學習英文嗎？說回程式語言，程式「語言」也是語言，是我們和電腦溝通的工具，大家都會「用」電腦，但是什麼才是真正的「會用」？我認為真正的重點在於「需求」，我也可以完全不需要英文，在台灣生活確實比較少使用到。程式語言也是一樣，現今各種人性化的工具推陳出新，就算不需要寫程式，一樣可以完成很多工作。不過對於現在這個大數據的時代、資訊發展迅速，資料在一般人眼中只是一串又一串的數字、文字或符號，對我們做病例分析來說，他們是一個個活潑的生命，但是看起來卻又只是一堆表格和數據，病例的增加可能會讓分析和觀察變得更加困難，這時程式語言絕對是最好的選擇。
   
   總之，現在這個資訊爆炸的時代，「程式語言」和「人工智慧」的運用將會成為趨勢。

## 為什麼要用R？

   其實搜尋資料就可以發現，最多人推薦的還是python，原因很簡單，因為R大多數是給統計專長的人作使用的，所以大多數的使用者都有統計和機率的背景。R語言會跑出的很多報表和圖表，都需要用統計的角度和原理進行解釋。統計領域對於一般人來說可能不是這麼有趣、甚至還有點無聊，光看到這屆總統大選前，藍白合的民調讓3%問題，就可以理解為什麼統計並不受大眾喜愛了！

   說到統計，從最簡單的，說出觀察到的事情，到各種估計方法、假設檢定、回歸分析等等都是統計領域的範疇，對於R語言來說，除了內建就有個各種統計工具之外，有著大量分析類的Package可以使用，再加上各種視覺化的工具 (像是 python 移植過來 R 的 plotly 、時間序列的 highcharter 和 R 原有的 ggplot)，都可以跑出令人滿意的圖形。

# R 基礎使用教學

各位好，我是呂一昕，接下來的幾個章節就是以逐字稿的方式去教學，如果覺得字太多太麻煩，那就點擊下方的`教學網頁`去看看程式碼的教學！或是如果看完之後還有興趣去學更深的內容就可以點擊下方的`R cookbook`。

* [教學網頁](https://yihsinlu.github.io/2024R.io/docs/presentation/Presentation2024summer.html)
* [R cookbook](https://rc2e.com/)

## 0 前言

在正式進入正題之前，我們先來看一個例子，這是一個在分析上很簡單也很經典的例子，資料顯示的是瑞士的銀行他們好奇說有沒有辦法使用鈔票的各項數據去分辨真假鈔，他們抽樣了各100張的真假鈔，共200張來進行數據測量，量每張鈔票的長度、上下左右的寬度和對角線，共6組數據。

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/0-1.jpg)

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/0-2.jpg)

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/0-3.jpg)

其中，我們發現底部的寬度好像有差異性，對角線更是如此，看來就像兩群。

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/0-4.jpg)

好奇之下，我們畫了這張散布圖，並用鈔票的真假去上色，果不其然跟我們猜想的一樣，單單靠這兩項數據既可以分別真假鈔了，這個舊最簡單使用R去看資料的方式。

## 1 R

R是語言，是我們跟電腦溝通的語言，電腦也必須有R語言，雖然R原本就內建跑程式的Compiler，但是因為是原始的工具，所以介面、功能等都非常陽春，所以我建議使用R Studio，除了介面簡單易懂，功能完整且強大。

* [下載R和R Studio教學](https://yihsinlu.github.io/2024R.io/docs/Rtutorial.html#r)

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/1-1.jpg)

R Studio 的介面可以自由調整，顏色、主題、字體大小等等，扣除上方的控制欄位，主要分成四個區塊，左上是開啟的檔案 (一打開R Studio是不會有的)、左下是程式運行的區塊，右上就是儲存的空間，只要你所有設定過的變數都會出現，也可以將它儲存成 .Rdata，最後是右下的視窗大部分是來下載Package或是搜尋你需要的內容。

### 1.1  基礎語法

最基本的變數就是數值和文字兩種，再加上邏輯值和各種變化，就成就了R語言。

#### 1.1.1 integer

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/1-2.jpg)

小時候都是從數字開始學，第一個類型當然就是在自然界完全不存在但又深深影響著我們的數值，會數數之後就會開始學四則運算，只要是和數學相關的都有辦法靠程式去運算。

不過這裡其實可以發現我們用的是`<-`箭頭，並不是`=`等號，雖然說效果是一樣，都是可以將右邊的值儲存進左邊的變數，但在R語言中，我還是建議使用`<-`，跟`=`做區隔。

主要的原因其實也很簡單，程式具有方向性，一班情況都是左到右、上至下，設定變數時，當我們使用向左`<-`時，就是把右邊送到左邊。最有趣的是，當我們把箭頭反過來，就會變成左邊送到右邊，舉例來說：`x <- 10`和`10 -> x`是一樣的意思，這個就是R比較特別的部分。 (更細節就需要我們自行去尋找網路上大神們的解釋了)

### 1.1.2 function

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/1-3.jpg)

有運算就會有各種不同的函數，但在城市語言上的函數不單單指的是數學的函數，只要是你丟變數進去跑出想要的結果都可以用函數去編寫，後面會提到更多不一樣的函數。


### 1.1.3 character

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/1-4.jpg)

任何的文字放進雙引號(或單引號)裡就會成為字元或字串，但是要注意的是，比如說，我想要打Stuednt's那我就必須注意單引號或雙引號，只能打"Stuednt's"，這樣就成功區隔開來。

### 1.1.4 vector

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/1-5.jpg)

跟函數一樣使用`c()`把我們想組成向量的值放進c這個函數哩，就可以跑出向量。

### 1.1.5 factor

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/1-6.jpg)

從向量衍伸而來的，只是改變變數的型態而已，主要是作為分類使用。

### 1.1.6 matrix

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/1-7.jpg)

多個向量組成矩陣，但在這裡其實可以發現矩陣這個函數`matrix()`	裡，放入了一個向量，將這個向量重新排列成矩陣的形式。這個分行的寫法可以更直覺地看出矩陣實際的長相，不過要注意的是其中除了`ncol`和`nrow`的乘積要是向量的個數外，後面還有一個`byrow`，如果填入`TRUE`照列的順序填入向量的值，反之，則是行。

### 函數 (function)和參數 (parameter)的設定

眼尖的你們可以發現`<-`和`=`的使用時機，在R語言中所做的其中一個區隔，所有任何`function()`這種形式的變數，在R裡都是函數，無論是向量的`c()`、`factor()`或是`matrix()`都是函數，在設定變數上才會用`<-`，和數裡有許多必須填寫的設定，我們稱為參數(parameter)。

舉例來說，矩陣的參數除了向量之外，`ncol`、`nrow`和`byrow`等都是這個函數的參數，有些參數勢必需要要填的，這時填入的方式就會使用`=`，如果使用`<-`是不行的，會運行失敗。

值得一提的是許多參數其實是有默認的設定的，像矩陣中的`byrow = FALSE`就是默認的。舉例來說，我寫`f <- function(x, y = 2){x*y}`，這時我如果跑`f(3,2)`、`f(x=3,y=2)`或`f(x=3)`都會得到一樣的結果。另外，有些參數是有限制的，可能必須是數值、必須是向量等。

總之，函數裡的參數設定一率是用`=`，變數的設定則是都可以。

### 1.1.7 list

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/1-8.jpg)

就像是資料夾一樣，無論任何形式的變數都可以放進去，也可以設定成像要的名稱，就算是函數、圖形都可以放進去，選取的方式也很容易，`list_name$variable_name`。

## 1.2 判斷式

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/2-1.jpg)

`ifelse`式所有運算程式都會有的條件判斷，差別只是名稱。我們在這裡會用`if()`，裡面放的是判斷條件，簡單來說就是裡面必須能出現`TRUE`或`FALSE`兩種值。

基本的寫法是：

* `if(condition1){thing1}`：如果`condition1`是對的，那做`thing1`，反之，是錯的，那什麼都不做。
* `if(condition1){thing1}else{thing2}`：和上面一樣，只是變成如果`condition1`是錯的，做`thing2`。
* `if(condition1){thing1}else if(condition2){thing2}else{thing3}`：一層一層判斷下來，以此類推。

特別需要注意的是裡面不能出現很多個`TRUE`或`FALSE`和非邏輯值。

## 1.3 迴圈

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/2-2.jpg)

常見的迴圈有兩種：`for()`和`while()`，我們只會提到我個人比較常用的`for()`，當我們需要重複做差不多的事情時，就可以使用。雖然其實在資料處理上不太需要用，但是有時真的沒辦法需要一行一行去處理時就會用到。

基本寫法為：

`for(i in vector){thing(i)}`：第一個迴圈，會把`i <- vector[1]`，`i`設成`vector`的第一個元素，進`thing`；第一個迴圈，會把`i <- vector[2]`，`i`設成`vector`的第二個元素，進`thing`...，以此類推，直到`vector`的元素全部跑完為止。

## 1.4 Package

看完這麼多的與語法和內容，當然一定會有前人留下的成果，世界上的大神們建立了無數個`package`提供不同需求的使用者使用，讓程式的編寫更加方便。

想要下載，有兩個方法：(實際上有三個，第三個屬於特殊情況，會放在後面)

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/3.jpg)

* R Studio的介面右下角，有一個`Packages`的欄位，點擊之後會看到下方出現很多`package`，右下視窗的左上角又一個`Install`的按鈕，按下之後會跳出新的視窗 (上方圖)，直接在`Packages`的欄位輸入要使用的`package`名稱，再按`Install`即可完成下載。 
* R Studio的介面左下角，`>`後面輸入`install.packages(package_name)`，在按`Enter`。

下載之後，我們就擁有`package_name`，要使用時在code中跑`library(package_name)`，才能使用`package_name`裡的內容。

最後，提到第三個，就是前兩種都失敗的方法，我們必須知道失敗原因：

* R版本不合，有些`package`可能更新版本的R去寫，這時只需要更新R就可以解決。
* `package`和`package`的版本不合，有些`package`是用其他的`package`寫成的，這時就必須找出你所沒有的`package`，並下載就解決了。
* `package`無法下載，這個就必須去網路上下載`package`，通常會找到`package_name.tar.gz`和`package_name.zip`可以下載，載完之後。(R Studio的介面右下角，有一個`Packages`的欄位，點擊之後會看到下方出現很多`package`，右下視窗的左上角又一個`Install`的按鈕，按下之後會跳出新的視窗 (上方圖))，在`Install from`的欄位選擇`Packages Archive File(.zip, .tar.gz)`，會跳出資料夾，找到剛下載的`package_name`，再按`Install`即可完成下載。 

## 2 機率與統計

這個章節主要是機率和統計的介紹，以我來說，我是應用數學系畢業的學生，大學部時期會修習一學期的基礎機率、一學期的統計學、一學期的機率論和兩學期的數理統計學，其中必須有一些微積分和集合論的概念。

以基礎R語言的使用和分析，可能不需要更艱深的數學和統計知識，這邊我大概只會初步的介紹，像是機率的基本概念、隨機變數等，如果真的有興趣可以參考課本([A Modern Introduction to Probability and Statistics](https://cis.temple.edu/~latecki/Courses/CIS2033-Spring13/Modern_intro_probability_statistics_Dekking05.pdf))。

### 為什麼要學機率與統計？

課本的開頭就有提到，這世界的東西真的全部都是隨機的嗎？各行各業其實都在運用機率和統計在探究這個世界各種隨機的事件，工廠生產物件的瑕疵率、當天天氣預報的降雨機率、日本男排在奧運奪牌的機率等等。在《統計改變了世界》這本書有提到，如果想了解這個世界，就必須學統計，因為它是探究上帝心意的工具，很多看似隨機的事情是有跡可循的。

什麼是機率？什麼是統計？統計就是提出假設或疑問，作實驗、觀察發現的事情，在發現的事情中找尋證據，進而說明你的家設是對的。

### 2.1 probability space

在日常生活中有非常多的事件 (events)，所有可能發生的事件組成一個樣本空間 (sample space $S$)，為了知道這些事件發生的機率，所以我們創造出機率 (probability measure $P$)也是機率測度，結合樣本空間和機率就成了機率空間 (probability space)：

$$
(S, P)
$$

這裡作一些小小集合論的介紹，以防可能數學式會看不懂。在樣本空間的這些事件都都可以交集、聯集，實際上可以說交集就是兩個事件同時發生，聯集就是任一個事件發生。舉例而言，我們好奇的投擲硬幣，事件 $A$ 是硬幣出現正面，事件 $B$ 是硬幣出現反面， $A\cup B$ 就是硬幣出現正面或反面，那這個事件剛好就是 $S$ ，因為正常硬幣不會出現其他情況； $A\cap B$ 就是硬幣同時出現正面和反面，但這根本不可能，所以剛好就是空集合。數學式可以記成：

$$
A\cup B = S \text{ and } A\cap B = \varnothing
$$

### 2.2 probability axioms (3)

1. $0\leq P(A)\leq 1, \text{ for any event} A.$

2. $P(S)=1$

3. 

$$
\sum_{i=1}^n P(A_i) = P(\bigcup_{i=1}^n A_i), \text{ for all } A_i\cap A_j = \varnothing. (i\neq j)
$$

機率必須符合上面這三條規則，機率不會有負的，也不會超過百分之百；所有事件的機率是1；互斥的事件的機率之間可以直接相加。

### 2.3 random variable

隨機變數就是記錄所有可能出現的數值，舉例來說：我有一個變數 $X$ 是投擲10次硬幣出現正面的次數，那 $X=10$ 就是10次全是正面的事件，有事件就有機率那我們也知道出現10次正面的機率就是 $P(X=10)=(\frac{1}{2})^{10}$ 。

這裡要特別說的是隨機變數會記成大寫的 $X$ ，數值才會寫成小寫的 $x$，以剛剛的來說，出現x次正面的機率就是 $P(X=x)$ 。

可能的數值又分兩種，所以隨機變數也分為兩種，離散型和連續型，他們有不一樣的機率運算方式，這裡就會用`分配`來說明這些數值分布的情形，這些分配的資訊就會用期望值 (expactation value / mean)和變異數 (variance)去代表，後面會慢慢再介紹。

* 期望值： $E(X)$，隨機變數才會有期望值，如果是數值的期望值依然相同。
	+ $X, Y$ 是隨機變數， $a, b$ 是數值
	+ $E(a) = a$
	+ $E(aX+b) = aE(x)+b$
	+ $E(aX-bY) = aE(X)-bE(Y)$

* 變異數： $Var(X)$
	+ $Var(a) = 0$
	+ $Var(aX+b) = a^2Var(X)$
	+ $Var(aX-bY) = a^2E(X)+b^2E(Y)$

#### 2.3.1 discrete random variable

離散型通常就是指可以從1、2、3開始數的，像是個數、次數等等，這類屬得出來的，用 probability mess function (f / pmf)計算事件的機率。

* 期望值：

$$
E(X) = \sum_{x=1}^nx_i f(x_i)
$$

* 變異數： 

$$
Var(X) = \sum_{x=1}^n(x-\mu)^2f(x)= E(X-E(X))^2=E(X^2)-(E(X))^2
$$

下面來介紹離散型隨機變數的分配：

##### 2.3.1.1 Bernoulli distribution

$$
X\sim Ber(p)
$$

這類事件比較簡單， $X=1$ 有發生，反之 $X=0$ 是沒發生，比如說X是硬幣出現正面， $X=1$ 就是正面，反之 $X=0$ 是反面。

* $P(X=1) = p$
* $P(X=0) = 1-p = q$
* $E(X) = p$
* $Var(X)=pq$

##### 2.3.1.2 binomial distribution

$$
X\sim Bin(n,p)
$$

它的原型就是Bernoulli distribution，Bernoulli作 $n$ 次就是binomial。

* pmf：

$$
P(X=x)=f(x) = \binom{n}{x}p^xq^{n-x},\forall x = 1, \cdots, n
$$

*  $E(X) = np$ 
*  $Var(X)=npq$ 


#### 2.3.2 continuous random variable

連續型的可能值通常是一個範圍，像是假如隨機變數說的是身高，從小嬰兒的40公分到金氏世界紀錄的251公分都是可能值，又或是像時間，秒下面有微秒、毫秒，沒辦法抓出一個精準的位置，這類就是連續型。這類隨機變數的機率計算就使用 probability density function (f / pdf)。

* 期望值：

$$
E(X) = \int_\mathbb {R}xf_X(x)dx
$$

* 變異數： 

$$
Var(X) = \int_\mathbb {R}(x-\mu)^2f_X(x)dx = E(X-E(X))^2=E(X^2)-(E(X))^2
$$

不過因為連續型的隨機變數也非常的多，所以我也挑三個最相關也最常見的來作介紹。

##### 2.3.2.1 exponential distribution

$$
X\sim\exp(\lambda)
$$

*  $f(x) = \lambda e^{-\lambda x}, x>0$ 
*  $E(X) = \frac{1}{\lambda}$ 
*  $Var(X)=\frac{1}{\lambda^2}$ 

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/exp.png)

這張圖是不同的 $\lambda$ ：

* 綠色： $\lambda=0.5$  
* 黑色： $\lambda=1$  
* 紅色： $\lambda=2$  

##### 2.3.2.2 normal distribution

$$
X\sim N(\mu,\sigma^2)
$$

* pdf：

$$
f(x) = \cfrac{1}{\sqrt{2\pi}\sigma}e^{-\frac{(x-\mu)^2} {2\sigma^2}},\;\forall\;x\in\mathbb{R}
$$

*  $E(X) = \mu$ 
*  $Var(X)=\sigma^2$ 


##### 2.3.2.3 t-distribution

$$
X\sim t_n
$$

* 當 $n$ 非常大，趨近於無窮大的時候，它的分配就會跟 $N(0,1)$ 一樣，我們稱 $N(0,1)$ 標準常態 (standard normal distribution)
* 下方的圖形，曲線越紅代表 $n$ 越大，紅色則是 $N(0,1)$ 。

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/t.png)

基本的機率統計就先停在這裡，當然還有很多特別的分配和統計的內容，如果有興趣的可以去看課本的介紹。

## 3 資料處理

資料處理是資料分析的第一步，同時有可能是最花時間的工程，資料的格式、型態等等都會讓分析起來比較困難，通常資料取得時可能不會像我們自己蒐集的資料這麼乾淨，我們就需要靠R來協助處理。

### 3.1 資料匯入

想要在R中使用資料，除了用`package`或原本就內建的資料表之外，還有兩個方式：

* 匯入`.xlsx`、`.csv`、`.txt`...
* 自行建立資料

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/4-1.jpg)

我們用`read.csv()`這個函數，參數要注意的是：

* 檔案的位置，有兩個方式：
	+ 把你的程式和`.csv`放在同一個資料夾，`read.csv("file_name.csv")`
	+ `read.csv("C:/.../file_name.csv")`至接用完整路徑

* `fileEncoding`在一般情況下，是不需要的，當你的`.csv`，可能有中文或特殊字元等其他原因才需要，可以查一下。
* `read.csv()`可以跑`.csv`，如果要跑其他的檔案可以試試看用`read.table()`。

### 3.2 資料建立

另一個方式就是自行建立資料 (data frame)，用`data.frame()`一行一行建立，在資料中，我們稱每一行叫變數 (variables)或特徵值 (features)， $n\times p$ 的 資料矩陣中，就會有 $n$ 列、 $p$ 行 (或是 $n$ 筆資料 $p$ 個變數)。

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/4-1.jpg)

這個資料表就有4筆資料5個變數。

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/4-2.jpg)

注意，每一行的個數都必須一樣。

### 3.3 資料合併

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/4-3.jpg)

`rbind()`縱向合併資料，變數數量必須一樣，目的為增加資料數量；使用`cbind()`進行橫向合併。

接下來，我們會使用資料處理最優秀的`package`，`dplyr`是文字探勘和資料分析很常見的工具，我們主要利用`%>%`疊加的功能，來實現資料的快速整理，基本概念就是，資料後加上`%>%`和想要做的函數，就會把資料放入函數中處理，實現較乾淨的程式碼。

### 3.4 增加、調整資料

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/4-4.jpg)

`mutate()`增加變數、`transform()`則依條件去改變變數。

### 3.5 資料選取

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/4-5.jpg)

`filter()`中放入篩選條件，取得符合條件的資料。

## 4 Basic Statistics with R

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/5-1.jpg)

在第二章機率和統計的介紹就提到過，可以運用一些數據去代表資料大致上的分布情形，平均數(期望值)`mean()`和變異數(標準差平方)`var()`呈現資料分布，相關係數`cor()`說明兩組資料之間的關係。

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/5-2.jpg)

最初步的方式就是利用`summary()`直接地去看整體的情況，最大、最小、平均數、中位數等。

### 4.1 Students' t-Test

假設檢定 (Hypothesis Test)是統計學裡，非常重要的一個篇章，不過這邊只教在R上怎麼作使用有興趣的就可以去看[課本](https://cis.temple.edu/~latecki/Courses/CIS2033-Spring13/Modern_intro_probability_statistics_Dekking05.pdf)的第25章。想法就是假設一個預期的情況，在用統計量去檢定這個假設是否成立。

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/6-1.jpg)

舉例而言，我在上個章節有一個100人的資料，我好奇平均身高是不是170公分。

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/6-2.jpg)

![](https://raw.githubusercontent.com/YiHsinLu/2024R.io/main/fig/ppt/6-3.jpg)