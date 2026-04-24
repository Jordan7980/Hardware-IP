<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" projectType="C/C++" name="fir_filter_hls" ideType="classic" top="fir_filter">
    <files>
        <file name="src/fir_filter.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="src/fir_filter.cpp" sc="0" tb="false" cflags="-Isrc" csimflags="" blackbox="false"/>
        <file name="../../tb/fir_filter_tb.cpp" sc="0" tb="1" cflags="-I../../src -Wno-unknown-pragmas" csimflags="" blackbox="false"/>
    </files>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
    <Simulation argv="">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="" mflags=""/>
    </Simulation>
</AutoPilot:project>

