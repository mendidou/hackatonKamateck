# hackatonKamateck

24H for this project

this is the repo of the IOS App that i was in charge the full project is here : 
- https://github.com/leonid1990/hackathon-kamatech-backend
- https://github.com/leonid1990/hackathon-kamatech-frontend

האקתון 2020 – קמאטק
פתרון לקטיעת שרשראות הדבקה וחקירות אפידמיולוגיות מהירות בחללים סגורים
הבעיה: בבתי רפואה נדרשים צוותי הרפואה לטפל בחולים שאינם חשודים כחולי קורונה בחללים סגורים דוגמת חדרי מיון
ופנימית רגילות.
מעת לעת לצערנו מתגלים חולים או אנשי צוות כמאומתים לקורונה. צוות בית הרפואה שהיה בסביבה נדרש להיכנס לבידוד.
ב 25.9.20 נדרשו 4,592 (!) אנשי צוות מבתי הרפואה להיכנס לבידוד. במקרה של חולה מאומת בבית רפואה או בחלק מן מקומות העבודה (דוגמת שירותי בתי הסוהר, משרד החינוך
וכדו') החקירה אפידמיולוגית מתבצעת באופן עצמאי חסרונות בשיטת הקיימת:
- זמן יקר של הצוות הרפואי לביצוע חקירות של מגעים ומי שהה ליד מי.. - שימוש במצלמות אבטחה שעלול לקחת זמן רב - פעמים שאנשי צוות נדרשים לבידוד שלא לצורך בגלל שלא ניתן לאמת מגעים
הפתרון: מערכת לניטור מגעים ושהות משותפים.
ב"ה
- רישום העובדים במאגר המערכת￼ - רישום חדרים וחללים במאגר המערכת - הנפקת מדבקת ברקוד להדבקה בכניסה לחלל (שלב ראשון שני ברקודים: לכניסה ויציאה) - העובדים יבצעו Login למערכת - בכניסה ויציאה מחדר טיפול יסרקו את הברקוד (קוד QR) - המערכת תשמור את הנתונים - במקרה שמתגלה חולה מאומת – יוזן לאדמין פאנל של המערכת פרטי העובד המאומת - המערכת תבצע aggregation לחישוב העובדים והחללים שנדרשים בבידוד
בונוסים:
- המערכת תוציא פושים לעובדים שנדרשים בידוד (ניתן ע"י מייל או סמס או במידה ותפותח אפליקציה ייעודית)
הבאים:
בשלבים
￼
- המערכת תוציא התרעה בניסיון כניסה לחדר שבו נמצאים נדרשי בידוד (עד לעדכון המערכת ששלב הבידוד הושלם)
- המערכת תנהל רייטינג לעובדים שמקפידים לתקף ברקוד בכניסה ויציאה (מקום העבודה יוכל לצ'פר עובדים בהתאם)
- דשבורד עם גרפים של מגעים ושהות משותפת – יאפשר ניהול הנחיות של קפסולות ומניעת התקהלויות - חיזוי כמות מבודדים במקרה שיתגלה חולה מאומת – יאפשר לצוות לחדד הנחיות להימנע ממצב שרוב
הצוות יאלץ להיכנס לבידוד - פיתוח אפליקציה ייעודית לנייד
כל האמור לעיל יכול להיות יעיל גם בבניין משרדים וחדרי ועידות.
Platforms:
בסיס נתונים ומשתמשים :mongoDB
לביצוע תחקירים - Elasticsearch: aggregations
- Back-End: nodeJS or dotnet Core Front-end: Angular
- Mobile app: IOS APP 
נדרש להכין מצגת פרזנטציה על הפתרון
