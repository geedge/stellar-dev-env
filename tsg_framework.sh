if [ -z "$TSG_PLATFORM_SETUP" ]; then

                #for c include
                if [ "$C_INCLUDE_PATH" ]; then
                export C_INCLUDE_PATH=/opt/tsg/framework/include:/opt/tsg/framework/include/MESA/:$C_INCLUDE_PATH
        else
                export C_INCLUDE_PATH=/opt/tsg/framework/include:/opt/tsg/framework/include/MESA/
        fi

                #for c++ include
        if [ "$CPLUS_INCLUDE_PATH" ]; then
                export CPLUS_INCLUDE_PATH=/opt/tsg/framework/include:/opt/tsg/framework/include/MESA/:$CPLUS_INCLUDE_PATH
        else
                export CPLUS_INCLUDE_PATH=/opt/tsg/framework/include:/opt/tsg/framework/include/MESA/
        fi

        #for linking
        if [ "$LIBRARY_PATH" ]; then
                        if [[ ! -n `echo $LIBRARY_PATH | grep '/usr/local/lib'` ]];then
                export LIBRARY_PATH=/opt/tsg/framework/lib/:/usr/local/lib/:$LIBRARY_PATH
                    else
                export LIBRARY_PATH=/opt/tsg/framework/lib/:$LIBRARY_PATH
                        fi
        else
                export LIBRARY_PATH=/opt/tsg/framework/lib/:/usr/local/lib/
        fi

                #for ld
        if [ "$LD_LIBRARY_PATH" ]; then
                        if [[ ! -n `echo $LD_LIBRARY_PATH | grep '/usr/local/lib'` ]];then
                export LD_LIBRARY_PATH=/opt/tsg/framework/lib/:/usr/local/lib/:$LD_LIBRARY_PATH
                    else
                export LD_LIBRARY_PATH=/opt/tsg/framework/lib/:$LD_LIBRARY_PATH
                        fi
        else
                export LD_LIBRARY_PATH=/opt/tsg/framework/lib/:/usr/local/lib/
        fi

        export TSG_PLATFORM_SETUP=1
fi