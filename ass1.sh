
con=true
while $con
do
echo "______MENU_______\n1.CREATE\n2.VIEW\n3.INSERT\n4.DELETE\n5.MODIFY\n6.SEARCH\n7.EXIT"
read -p "Enter your choice :: " ch
case $ch in
1)	read -p "Enter the name of the book :: " book
	touch $book;;
2)	cat $book;;
3)	read -p "Enter the name of the Student :: " name
	read -p "Enter the address of the student :: " addr
	read -p "Enter the roll no. of the student :: " roll
	echo "$roll $name  $addr">>$book
	;;
4)	read -p "Enter the roll no of the student to delete the record :: "  r2
	#sed '/$r2/d' $book
	z=$(grep -c -w $r2 $book)
	if test $z -eq 0
	then echo "record not found"
	fi
	grep -v -w $r2 $book > database.txt
	mv database.txt $book
	;;
5)  z=$(grep -n "$r2" $book | grep -Eo '^[^:]+')
	t=$(cat $book | wc -l)
	head -n $(($z-1)) $book >> database.txt
	read -p "Enter the name of the Student :: " name
	read -p "Enter the address of the student :: " addr
	read -p "Enter the roll no. of the student :: " roll
	echo "$roll $name  $addr" >> database.txt
	tail -n $(($t-$z)) $book  >> database.txt
	mv database.txt $book
	;;
6)	read -p "Enter the roll no of the student :: "  r1
	grep -w $r1 $book
	;;
7)	con=false;;
*)	echo "Entered choice is invalid!!";;
esac
done
