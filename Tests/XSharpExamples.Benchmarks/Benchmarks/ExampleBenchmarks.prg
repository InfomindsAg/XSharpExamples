using System
using System.Collections.Generic
using System.Linq
using System.Text
using BenchmarkDotNet.Attributes;

[InProcessAttribute];
class ExampleBenchmarks

    [Benchmark];
    method Start() as void
        ExampleForBenchmark{}.Start()
        return
        
    [Benchmark];
    method Opt1NoLateBound() as void
        ExampleForBenchmark{}.Opt1NoLateBound()
        return

    [Benchmark];
    method Opt2UseStringBuilder() as void
        ExampleForBenchmark{}.Opt2UseStringBuilder()
        return

    [Benchmark];
    method Opt3StringComparison() as void
        ExampleForBenchmark{}.Opt3StringComparison()
        return
        
end class

