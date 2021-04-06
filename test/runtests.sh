echo "Running unit tests:"


run_test() {
    if test -f $1
    then
        if $VALGRIND ./$1 2>> test/tests.log
        then
            echo $1 PASS    
        else
            echo "ERROR in test $1: here's test/tests.log"
            echo "---------"
            tail test/tests.log
            exit 1
        fi
    fi
}   
for i in test/*_tests
do
    if [ -z "$1" ]
    then
        run_test $i
    else
        if [ "test/$1" == "$i" ]
        then
            run_test $i
        fi
    fi
done

echo ""
