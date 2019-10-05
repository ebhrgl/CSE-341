;PROJECT1 LEXER
;EDA BAHRIOGLU 131044055

(ns tokenize
  (:import (java.io BufferedReader FileReader)))

(use '[clojure.string :only (join split)])

(def ADD_OP "operator_+")
(def SUB_OP "operator_-")
(def MULT_OP "operator_*")
(def DIV_OP "operator_/")
(def LEFT_PAREN "identifier_(")
(def RIGHT_PAREN "identifier_)")
(def AND  "keyword_and")
(def  OR  "keyword_or")
(def NOT  "keyword_not")
(def EQUAL  "keywor_equal")
(def APPEND  "keyword_append")
(def CONCAT  "keyword_concat")
(def SET  "keyword_set")
(def DEFFUN  "keyword_deffun")
(def FOR  "keyword_for")
(def WHILE "keyword_while")
(def IF  "keyword_if")
(def THEN "keyword_then")
(def ELSE  "keyword_else")
(def TRUE  "binaryValue_true")
(def FALSE  "binaryValue_false")

;apply fonlsiyonu stringi cekmek icin kullanılmistir.
;join karakter eklemek icin kullanilmistir.
;split bosluga kadar karakteri alir.
;slurp dosyadan liste halinde string okumasi yapmamizi sağlar.

(defn lexer [filename]
	
	(println	
		(apply str
			(join"\n"
				(split 
					(slurp filename)#"\s"))))
(println "\n")

;String list icindeki tüm karakterler teker teker kontrol edilir.
	(loop [x 0]
	  (when (< x (count (slurp filename) ))
	  
;Dosyadan okunduğu haliyle operator,keyword, interger value ve value binary durumlari ekrana basilmistir.
;OPERATOR CONTROL

		(nth (slurp filename) x)
			(println
				(cond
					(=  (nth (slurp filename) x) \() 
					LEFT_PAREN
					(=  (nth (slurp filename) x) \)) 
					RIGHT_PAREN
					(=  (nth (slurp filename) x) \+) 
					ADD_OP
					(=  (nth (slurp filename) x) \-) 
					SUB_OP
					(=  (nth (slurp filename) x) \*)
					MULT_OP
					(=  (nth (slurp filename) x) \/) 
					DIV_OP

;KEYWORD KONTROL
					(=  (nth (slurp filename) x) \a)	
					AND
					(=  (nth (slurp filename) x) \o)
					OR 
					(=  (nth (slurp filename) x) \n)
					NOT
					(=  (nth (slurp filename) x) \e)
					EQUAL
					(= (nth (slurp filename) x)  \p)
					APPEND
				    (= (nth (slurp filename) x) \n)
					CONCAT
					(= (nth (slurp filename) x) \s)
					SET
			 		(= (nth (slurp filename) x) \d)
					DEFFUN
					(= (nth (slurp filename) x) \f)
					FOR
					(= (nth (slurp filename) x) \w)
					WHILE
					(= (nth (slurp filename) x) \t)
					THEN
					(= (nth (slurp filename) x) \f)
					IF
					(= (nth (slurp filename) x) \l)
					ELSE

;BINARY VALUE KONTROL

					(= (nth (slurp filename) x) "true") 
			        TRUE 
				    (= (nth (slurp filename) x) "false")
					FALSE 
;INTEGER VALUE CONTROL
					(= (nth (slurp filename) x) \1) 
					"Int_value"
					(= (nth (slurp filename) x) \2) 
					"Int_value"
					(= (nth (slurp filename) x) \3) 
					"Int_value"
					(= (nth (slurp filename) x) \4) 
					"Int_value"
					(= (nth (slurp filename) x) \5) 
					"Int_value"
					(= (nth (slurp filename) x) \6) 
					"Int_value"
					(= (nth (slurp filename) x) \7) 
					"Int_value"
					(= (nth (slurp filename) x) \8) 
					"Int_value"
					(= (nth (slurp filename) x) \9) 
					"Int_value"
					(= (nth (slurp filename) x) \0) 
					"Int_value"
			))
				
			(recur (+ x 1))))

)

(lexer "CoffeeSample.coffee")





