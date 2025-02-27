# ✍️ 프로젝트매니저 저장소
 
> 프로젝트 기간 2022.07.04 ~ 2022.07.15 </br> 
팀원: [Quokkaaa](https://github.com/Quokkaaa)
리뷰어: [엘림](https://github.com/lina0322)
 
## 🛠 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]() [![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]() [![iOS](https://img.shields.io/badge/iOS-15.0-red)]()
 
## 👨‍🔧 기술스택 
기술스택 | Design Pattern | LocalDB | Remote DB | Convention | 
-- | -- | -- | -- | -- |
UIkit | MVVM | Realm | FireBase | SwiftLint | 
 
## ✅ 프로젝트 중 핵심경험
- [ ] UIKit / SwiftUI / RxCocoa 등 선택한 기술을 통한 UI 구현
- [ ] 다양한 기술 중 목적에 맞는 기술선택
- [ ] Word wrapping 방식의 이해
- [ ] 리스트에서 스와이프를 통한 삭제 구현
- [ ] Date Picker를 통한 날짜입력 
 
## 이번 프로젝트 수행시 제약사항
- 코드에 느낌표(!)를 사용하지 않습니다
- UI는 UIKit / SwiftUI / RxCocoa 중 한가지로 구현합니다
- SwiftLint를 활용하여 코드 스타일을 일관성있게 유지합니다
- 아키텍쳐 및 외부 라이브러리 활용은 자율로합니다
단, 리뷰어와 먼저 상의 후 적용해야합니다
- 메서드 내부의 들여쓰기는 한 번으로 제한합니다 
 
## 목차
 
- [프로젝트 소개](#프로젝트-소개) 
 
- [STEP1](#STEP1)
    + [타임라인](#🗓타임라인) 
    + [고민한점](#🤔고민한점) 
    + [트러블슈팅](#🔥TroubleShooting) 
- [STEP2](#STEP2)
    + [타임라인](#📅타임라인) 
    + [고민한점](#🤨고민한점) 
    + [트러블슈팅](#🧨TroubleShooting) 

- [그라운드 룰](#그라운드-룰)
    + [활동 시간](#활동-시간)
    + [코딩 컨벤션](#코딩-컨벤션)

---



## [STEP 1]

# 🗓타임라인
- 월 - db 종류 비교분석 및 선택
- 화 - 곰튀김 강의 시청 및 STEP1 PR
- 수 - 예습 및 STEP2 구상
- 목 - tableView와 collectionView 의 선택 및 UI구상
- 금 - STEP2-1구현 및 리드미 작성

# 🤔 고민한점 ( Local & Remote DB )

- LocalDB
> **Realm** 를 선택했습니다. 이유는 sql과 coreData보다 성능이 좋다는 그래프를 확인했습니다. 그래프 수치상으로는 약 2배정도 빨랏는데요. 얼만큼 차이가 있을진 모르겠으나 이게 데이터를 많이 오고가고 해야할 상황이라면 데이터가져오고 가는게 빠르면빠를 수 록  사용자입장에선 조금이나 더(?) 빠르게 느낄 수 도 있지않을까 판단했습니다.


- Remote DB
> **Firebase**를 선택했습니다. fireBase와 cloudkit, mongoDB정도를 고민해봤었는데요 이 부분에서는 대중적으로 사용하고 구현이 쉽다는 점과 무엇보다 추천을 해주신게 영향이 컸던 것 같습니다. 

# FireBase DB에 대해서
- 하위 버전 호환성에는 문제가 없는가?
 
![스크린샷 2022-07-05 20 46 01](https://user-images.githubusercontent.com/91132536/177320534-235f2b8a-dccd-462f-bc96-c37bdde6f19c.png)


> 공식문서를 확인해보니 iOS는 10 버전 이상, macOS 10.12 이상, tvOS 12, watch OS 6 이상이어야 사용이 가능하다고 확인되는데요 iOS 사용 유저가 iOS이신 분들이 대부분이라서 하위버전에 사용유저걱정은 크게 없어보인다고 생각했습니다.

- 안정적으로 운용 가능한가?
> 사용자 인증하고 보안 규칙을 작성하여 데이터에대한 읽기/ 쓰기 접근을 제한할 수 있고 토큰생성으로 확인을하며 안전하게 저장하는것으로 알고있습니다. 토큰에대해서 얼마나 안전한지까지는 알아보지않았지만 깃허브 같은 큰 기업도 토큰을 사용하기때문에 안전하다고 봐도되지않을까 생각했습니다.

- 미래 지속가능성이 있는가?
> global market시장에서 3번째로 많은것으로 확인했는데요 2014년도에 구글이 성장률을 보고 인수를 했다고 하고 현재도 사용자들이 많이 사용하는것을 보면 그 만큼 사용자가 만족하고 또 유저가많다보면 피드백받고 개선할 수 있는 점(?)도 많지 않을까 생각해봤습니다. 

- 리스크를 최소화 할 수 있는가? 알고있는 리스크는 무엇인가?
> firebase의 단점 중에 제한된 데이터 마이그레이션과 실시간 DB에는 데이터필터링이 없다는 점이 있다고 하더라구요

- 어떤 의존성 관리도구를 사용하여 관리할 수 있는가?
> SPM와 CocoaPod을 사용해 관리할 수 있습니다.

- 이 앱의 요구기능에 적절한 선택인가?
> Mongo DB 는 성능이 좋지만 빠르게 성장하는 스타트업같이 확장성이 있는 기업에 적합했고 Cloukit은 유연성과 관리용이, 성능을 위해 설계됬다보니 쿼리 기능이 강력한데 이를 또 잘 사용하지는 않을 것 같았습니다. 그래서 간단한 앱인만큼 구현과 사용이 편한 Firebase 를 사용하기에 적절한 것 같습니다.



# 🍏 Local DB
**storage skill**
> 모바일 앱의 성능을 결정하는 한가지 요소가 검색어에 대한 응답성이다. 응답 속도가 빠를 수록 성능이 향상된다. 성공적인 검색결과는 앱의 데이터를 저장하는데 사용되는 DB효율성에 중요하다.


## 1️⃣ SQLite
- Mac OS-X, iOS, Android, Linux 및 Windows 모두 접근이 가능하다.
- 데이터 저장이 쉽다.
- 여러 스레드에서 안전하게 접근이 가능하다.
- 여러 열이 있는 테이블에 데이터를 쉽게저장한다.
- 서버 사용에 제한이 없다.
    
## 2️⃣ CoreData
**기존의 테이블 데이터방식보다 객체에 더 중점을 두는 방식**
- Objective-C로 내용을 저장한다.
- SQLite비해 더 많은 메모리를 사용한다.
- SQLite비해 저장 공간이 크다.
- SQLite에 비해 레코드 가져오는 응답 속도가 빠르다.


## 3️⃣ Realm렐름
**이전 DB 솔루션보다 더 빠르고 효율적으로 설계되었으며 모바일 DB이다.**

**특징)**
- Objective-C, Swift에서 사용할 수 있으며 iOS 및 Android용으로 설계되었다.
- 많은 레코드와 사용자를 위한 확장성에 적합하다.
- 쿼리를 마이그레이션하여 데이터 검색이 가능함


**장점)**
- CoreData와 SQLite에 비해 설치가 쉽고 작업속도가 빠르다.
- 빠르고 사용하기 쉽다.(CoreData는 10줄의 코드가 필요할때 Realm은 한줄로 동일한 작업을 수행할 수 있다.)
- 서버사용에 제한이 없다.
- 속도와 성능을 위해 자체 지속성엔진에서 작업한다.
- 마이그레이션시 프로퍼티를 내부적으로 관리하므로 지정해줄 필요가없어 클래스 헤더가 최소화된다.


**단점**
- iOS8 또는 OS X 10.9이상이어야 지원이 가능하다.


# Reference
- https://sebastiandobrincu.com/blog/5-reasons-why-you-should-choose-realm-over-coredata
- https://www.cloudbees.com/blog/ios-databases-sqllite-core-data-realm
- https://developer.apple.com/forums/thread/649649
- https://purple-log.tistory.com/13
- https://www.ileafsolutions.com/blog/sqlite-core-data-and-realm-which-one-to-choose-for-ios-database/

# 🍎 Remote DB

## 1️⃣ MongoDB
**개요 NoSQL**
**SQL은 대량의 데이터를 빠른속도로 처리하는게 어렵기때문에 이를 어느정도 대체해주는 몽고디비가 나오게됨**

- Key-Value와 다르게 여러 용도로 사용가능
- json형태를 사용
- join이 필요없도록 데이터 설계를 해야함

**특징)**
- 메모리에 읜존적
- 메모리를 넘을 경우 성능이 급저하됨
- 쌓아놓고 삭제가 없는 경우에 적합함
  - 이벤트 참여내역
  - 로그 데이터
  - 세션
- 트랜젝션이 필요한 금융, 경제, 빌링, 회원정보에는 부적합함 ( 이런경우는 RDBMS )

=> **일관성을 유지해야하고 보완성이 필요한 중요한 정보등의 경우에는 RDBMS를 사용하면된다.**

**장점)**
- DB에 복잡한 Join이 없다.
- 깊고 복잡한 쿼리를 만들 수 있다.
- 간편한 확장
- 구조화되지않은 데이터를 조직화된 방식으로 저장할 수 있다.
- 모든 종류의 문서를 가상으로 조작하거나 모델링이가능하다.
- 사용자친화적이다.


**단점)**
- 데이터 업데이트 중 장애발생시, 데이터 손실 가능성 존재
- 많은 인덱스 사용시, 충분한 메모리 확보필요
- 데이터 공간 소모가 RDBMS에 비해 많음
- 복잡한 Join사용시 성능 제약이 따름
- transactions 지원이 RDBMS대비 미약
- MongoDB불안전성: 데이터의 유실 가능성
  - 데이터양이 많을 경우
    - 일부 데이터 손실 가능성 존재
    - 데이터 분산저장의 비정상적인 동작가능성
    - 비정상 동작가능성

=> **장점이 극명해 단점을 감안하고도 noSQL사용 비율 1위**

## 실제 사용사례
**다양한 장점과 사용사례존재하지만 이상적으로는  진화와 확장성이 빠른 언테넷 및 비즈니스앱에 사용하는게 좋다. 텍스트 관리나 조작하거나 높은 읽기및 올바른 트래픽확장 할때 좋다.**

- 콘텐츠 관리시스템(블로그 댓글저장기능을 제공함)
- 제품 데이터 관리(전자상거래 사이트)
  - 유연한 스키마를 제공해 문서조작이 쉽기때문
- 장바구니를 상요해 사용자의 쇼핑선호도를 유지함
- 실시간 분석 및 운영 인텔리전스

> 그래서 아래와 같은 행동을 취햄
1. Stitch와 같은 서비스 출시
2. Atlas와 같은 현재서비스기능확장
3. Realm인수(2020/4)

> Chart, Stitch, Atlas와 같은 클라우드 쪽에서 다양한 진화를 했으으며 모든 사람이 접근할 수 있어 매우 사용자 친화적이다.


## 질의응담
- 하위 버전 호환성에는 문제가 없는가?
> 공식문서를 참고했을때 버전마다 호환안되는 문제점에대한 해결책들이 적혀있고 호환되지않는 메서드?도 확인해볼 수 있다. 별다른 문제는 없어보임

- 안정적으로 운용 가능한가?
> 모든데이터가 안전하게 저장되는 매우 안전한 DB프로그램이다. 데이터가 암호화되서 저장되며 MongoDB나 다른 사용자를 포함해 누구도 해독할 수 없다. 오직 데이터와함께 전체 데이터베이스는 사용간으한 데이터를 고나리, 저장 및 변경할 수 있는 권한자만 사용할 수 있습니다. 또한 위험을 최소하하기 위해 MongoDB소유자 고객의 민감한 정보를 확인하거나 접근할 수 있는 권한이 없습니다.
 
- 미래 지속가능성이 있는가?
> 많은 회사가 서버리스가 되기시작하며 대부분의 사람들은 클라우드서비스와 호환되는 DB가 필요했다. 이러한 욕구를 총족하기위해 mongoDB는 이러한 요구를 총족시키기 위해 Atlas 및 Charts와 같은 다양한 클라우드 서비스를 출시했지만 AWS한테 밀림
 
- 리스크를 최소화 할 수 있는가? 알고있는 리스크는 무엇인가?
> 2016년 12월과 2017년 3월에 3만개의 DB해킹, 삭제 요청이있었다. 손실바용이 500달러정도였지만 회사평판과 사용자 신뢰를 떨어뜨렸따. 왜 이런일이 발생한걸까? DB는 보안 구현하는 측면에서 거의 수행하지않았고 기본즉시사용가능한 기본값을 사용해 서버 이미지를 완전히 열어 노출시켰었다. MongoDB는 보안 기본값 을 제공해 소스에서 이문제를 완화했지만 여전히 보안취약성 발생여지는 존재해보인다. 여기서의 문제는 MongoDB가 안전하지 못하기때문이 아니라 이미지 및 서버에 대한 보안 프로토콜 구현이 부족하기때문이다.

> 2018년에도 4억4500만개의 레코드가 노출됬었다.

자세한건 https://www.securecoding.com/blog/mongodb-security/ 여길 봐보자.
- 어떤 의존성 관리도구를 사용하여 관리할 수 있는가?
> SPM, CocoaPod, Carthage

- 이 앱의 요구기능에 적절한 선택인가?
> 적절한지는 잘 모르겠다. 스타트업같이 확장성과 빠른성장하는데에 적합하다고 하다보니 그런앱과는 거리가 좀 있는것으로 보이긴한다.


## 참고
- [mongoDB에관한 상위 60개의 인터뷰 질문 및 답변](https://www.upgrad.com/blog/mongodb-interview-questions/)
- https://realm.io/best-ios-database/#use-cases-for-iOS-object-oriented-databases
- https://www.upgrad.com/blog/the-future-scope-of-mongodb/
- https://www.upgrad.com/blog/the-future-scope-of-mongodb/



## 2️⃣ firebase
- 구글에서 지원하는 cloud서비스임
- 비관계형이다.

**장점)**
- 빠르고 안정적이며 웹 및 앱 모두 지원
- 자체 호스팅 제공
- 구현이 쉽고 고급 지식이 필요하지않다.
  - json 파실할 필요가 없다.
- 사용유저가 많아 충분한 기술문서를 제공한다.

**단점)**
- 쿼리 기능이 제한되어있다.
  - 실시간 DB에는 데이터필터링 방법이 없다.
- 보안 수준이 높지않다.
- 안드로이드 중심이다.
- 제한된 데이터 마이그레이션

## 3️⃣ Cloudkit
관리 용이 및 유연성, 성능을 위해 설계되었음

**장점)**
- 외부 종속성이 필요없다.(cocoa touch에 포함되어있기때문에 import할 필요가 없다.)
- iCloud계정을 사용하므로 인증을 설정할 필요가 없다.(로그인만하면됨)
- 생성 및 사용시 알림을 자동생성할 수 있다.
- 쿼리 기능이 강력하다.

## reference
https://medium.com/swift-blondie/cloudkit-vs-firebase-cb23d5e923b7

## [STEP2-1]

# 🤨고민한점
- tableView로 구현하면서 어떤걸 고민하고 느꼈는지
  - 첫째로, 내가 이해한봐로는 tableView에서 cell간의 간격을 띄어주려면 중간에 view를 생성하여 넣어줘야했다. 이는 cell이 별로없으면 상관이없겠지만 실제로 비즈니스한다고 생각할때는 많은 view를 생성해줘야한다고 생각했다. 그래서 이러한 비용이 꽤나 크게들어갈 것같아서 이렇게 구현하는게 맞을지 고민됬었다.
  - tableView 3개로 구현할시 역할분리가 어려웠음 하나의 VC에서 관리해주어야할지 아니면 각각의 VC를 만들어서 관리해줘야할지(?) 고민하는게 어려웠따. 일단 view를 3개로 나눌 필요는 없었고 view라는게 사실 tableView 3개 외에는 특별한게 없어서 하나의 VC로 관리해보기로 하였따. 그런데 각각의 tableView로 data를 분배해주고 delegate를 구현해주고 하려다보니 에러가 발생했을때 에러찾는게 되게 번거롭고 시간도 오래걸렸다. 그래서 tableView3개로 고민하는게 맞을까 ? 라는 생각이들면서 collectionView로 구현하는건 어떨지에대해 고민하게되었다.

- tableView와 collectionView 둘 중 어떤걸 사용할 것 인가?
  - tableView는 단순하고 구현이쉽다는 장점이있다. collectionView와 tableView의 큰 차이점이 cell을 dynamic하게 그리고 여러개의 section을 나눠서 구현하는 유연성은 훨씬 collectionView가 월등하다고 생각했다. 그리고 apple에서 tableView에대해 손을 떼고 collectionView로 대체하는 흐름이기때문에 당장은 아니겠지만 나중에 tableView가 deprecated될 수도 ? 있지않을까 라는 가능성도 배제할 수 없어 조금은 불안했떤 것 같다.
그리고 cell사이에 간격에 view를 추가로 넣어줄 필요없이 기본적으로 프로퍼티를 가지고 있었다. 추가로 collectionView는 compositionalLayout이라는 기능이 있기때문에 하나의 view안에 3개의 section을 나눠서 구현하면 요구사항대로 구현할 수도 있을거라고 판단했다.

- collectionView로 UI를 구성한다면 어떻게 구현 해볼 수 있을까 ?
<img width="976" alt="스크린샷 2022-07-08 14 54 06" src="https://user-images.githubusercontent.com/91132536/177934478-ccb2540d-c1b1-46c6-b745-e236aa531dd7.png">


# 🧨TroubleShooting
- tableView3개로 구현하는걸 시도했었다. todo Cell을 만들고 doing, done에게 상속을해주고 VC에서 tableView3개를 구현해보았다. 그런데 dataSource = self를 해주었으나 메서드가 3개의 tableView 중 어떠한 tableView의 cell을 업데이트해줘야할지 컴퓨터입장에서는 모른다는 것이다. 
즉, `- tableView를 한 뷰컨에서 여러개쓸때 datasource에서 tableView구분을 일일히 해주지않으면 에러가난다. 야 너왜 cell tableView = self 이렇게 위임해서 내가 처리하게해놓고 cell등록을 안했어 ?
그러니깐 뷰컨은 저렇게 tableView == todoTableView이렇게 지정을 해주지않으면 알아먹질 못하는 모양이다. 그래서 자 얘는 얘, 재는 재 이렇게 내가 지정해줬으니깐 datasource위임 잘 부탁할게 가 되야하는것이다.`

### [에러발생]
<img width="852" alt="스크린샷 2022-07-07 10 08 37" src="https://user-images.githubusercontent.com/91132536/177931710-775c04cb-c1c8-44e7-8b55-2e1031ec5b0d.png">

### [에러해결]
<img width="803" alt="스크린샷 2022-07-07 10 36 57" src="https://user-images.githubusercontent.com/91132536/177932130-6a092534-f208-4406-83f8-3bcffb6153f8.png">

- collectionView의 dynamicSize를 높이 설정에대한 이슈
cell사이즈를 절대값으로 설정해주었더니 cell이 나오지않는 현상이 발생했다. stackoverFlow를 확인해보니 사이즈를 정해줄때 frame을 설정하면안되고 너비와 높이만 설정할 수 있다고 확인하였다. 그래서 아래와 같이 수정해주었더니 cell이 다시 확인되었다.
[참고자료](https://stackoverflow.com/questions/32039297/uicollectionview-showing-only-one-cell-which-changes-when-the-view-is-scrolled)
[참고자료2](https://stackoverflow.com/questions/38028013/how-to-set-uicollectionviewcell-width-and-height-programmatically))
```swift
  private let todoCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    
    let cellWidth = UIScreen.main.bounds.width
    let cellHeight = UIScreen.main.bounds.height / 4
    layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
    
    layout.estimatedItemSize = CGSize(width: cellWidth, height: cellHeight)
    
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 5
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .systemGray5
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.dragInteractionEnabled = true
    return collectionView
  }()
```

## [STEP2-2, 2-3]
# 🤨고민한점 및 알게된점

```swift
required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
```

- required init? 은 xib나 storyboard에서 생성될때에 Init이 발동하는걸로 알고있는데 코드로 구현하는데 이 Init이 발생될 이유가 있을까요 ?

저는 현재 선언만 했었지 실질적으로 사용해본적은 없지만 회사입장에서 어떤 방식으로 유지보수할지 알 수가 없고,
모든 상황을 컨트롤 할 수 있다고 확신할 수 없다고 생각합니다.
늘 예상치 못한 상황이 발 생할 수도 있는 가능성도 생각했을때 이러한 부분도 에러 처리를 해주는게 안전하다고 생각한다.


- viewModel에 UIkit Import되면 안되는건가요 ?
> 실제로 이런 룰은 없지만 기본적으로 view와 ViewModel의 의존성이 발생하지 않게 하는것, 그리고 view의 역할과 viewModel의 역할을 분리하기위해서 그리고 테스트에 용이하기위해서 viewModel에 UIkit이 import되지 않는것이 좋아보인다.
그런데 예외?의 상황이 있을 수 있고 이게 좋다는 것이지 꼭 그래야한다는 의미는 아닌것같다.
 
예를들어서 data관련된 값은 viewModel의 역할인데 dataSource프로퍼티에  snapshot을 통해 값을 binding하는게 데이터를 다루는 일이기때문에 viewModel의 역할이라고 볼 수 있다. 이럴때는 viewModel에 DataSource 타입을 가지려면 UIkit이 import되어야하기때문에 예외?인 상황이라고도 볼 수 있는것같다.

- index를 안전하게 처리하는방법
```swift
extension Array {
  subscript (safe index: Index) -> Element? {
    return self.indices ~= index ? self[index] : nil
  }
}
```

index는 혹여나 사이드이펙이든 예상치못한 상황에서 out of range가 발생하여 앱이 죽을 수 있기때문에 이런상황을 대비해 안전하게 처리해줘야한다.

- dateForMatter를 생성하는 비용이 크다.
[dateFormatter비용 테스트](https://sarunw.com/posts/how-expensive-is-dateformatter/#experiment-%234%3A-how-expensive-is-changing-dateformatter-properties) 

만일 만든다면 static으로 만들거나 프로퍼티로 미리 초기화를 시켜놓는 방식 사용하는게 비용을 줄일 수 있는 방법

만일 한번  사용할까말까 확실하지않다면 메서드나 lazy var로 활용해볼 수도 있을 것같음.


# 🧨TroubleShooting

- DB저장할때 error발생시 어떻게 처리할 것인지?
throws로 에러를 전파하여 VC에서 처리를 해주자니 throws 함수가 너무많아지고 반환타입을 Result같은걸로 받자니 Create같은 메서드는 반환타입이 필요없는데 사용하는게 옳은것일지? 잘 모르겠어서
일단 아래와같이 노티피케이션으로 처리하였다.
```swift
  private func postNotification(_ error: Error) {
    NotificationCenter.default.post(
      name: Notification.Name(rawValue: "RealmError"), object: error
    )
  }
````

단점이 노티피케이션은 일일이 뷰컨에 노티등록을 해주고 처리해줘야하기때문에 유지보수가 좋은 코드인지 모르겠.
만약에 다른 에러처리로 변경한다고 했을때 쉽게 갈아낄 수 있는 구조가 좋이면 좋을 것 같은데 어떻게 해야할까..?


## [STEP3]
# 🤨고민한점
# 🧨TroubleShooting

## ✅ 그라운드 룰

#### 
- 오전 7시 ~ 22시 
- 점심시간 12시 30분 ~ 14시
- 저녁시간 6시 ~ 7시

---

### 코딩 컨벤션
#### 1. Swift 코드 스타일
[스타일가이드 컨벤션](https://github.com/StyleShare/swift-style-guide#%EC%A4%84%EB%B0%94%EA%BF%88)

#### 2. 커밋 메시지
#### 2-1. 커밋 Titie 규칙
```
feat: [기능] 새로운 기능 구현.
bug: [버그] 버그 오류 해결.
refactor: [리팩토링] 코드 리팩토링 / 전면 수정이 있을 때 사용합니다
style: [스타일] 코드 형식, 정렬, 주석 등의 변경 (코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
test: [테스트] 테스트 추가, 테스트 리팩토링(제품 코드 수정 없음, 테스트 코드에 관련된 모든 변경에 해당)
docs: [문서] 문서 수정 / README나 Wiki 등의 문서 개정.
chore: [환경설정] 코드 수정
file: [파일] 내부 파일 수정
rename: [네이밍] 네밍 수정
```

#### 2-2. 커밋 Body 규칙
- 들여쓰기 한번만 가능
- 현재 시제를 사용, 이전 행동과 대조하여 변경을 한 동기를 포함하는 것을 권장
- 문장형으로 끝내지 않기
- subject와 body 사이는 한 줄 띄워 구분하기
- subject line의 글자수는 50자 이내로 제한하기
- subject line의 마지막에 마침표(.) 사용하지 않기
- body는 72자마다 줄 바꾸기
- body는 어떻게 보다 무엇을, 왜 에 맞춰 작성하기

