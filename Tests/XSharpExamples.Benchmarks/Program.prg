using System
using System.Collections.Generic
using System.Linq
using System.Text
using BenchmarkDotNet.Jobs
using BenchmarkDotNet.Running
using BenchmarkDotNet.Configs
using BenchmarkDotNet.Columns
using BenchmarkDotNet.Diagnosers
using BenchmarkDotNet.Reports
using BenchmarkDotNet.Toolchains.InProcess.Emit
using BenchmarkDotNet.Exporters.Csv

function Start() as void strict

   var config := Config{};
      .WithOptions(ConfigOptions.JoinSummary);
      .WithOptions(ConfigOptions.DisableOptimizationsValidator);
      .AddDiagnoser(MemoryDiagnoser.Default)

   BenchmarkRunner.Run(typeof(Config).Assembly, config)
   wait

   return

class Config inherit ManualConfig

   constructor()
      self.AddLogger(DefaultConfig.Instance.GetLoggers().ToArray())
      self.AddColumnProvider(DefaultConfig.Instance.GetColumnProviders().ToArray())
      self.AddExporter(CsvExporter{;
            CsvSeparator.CurrentCulture,;
            SummaryStyle{;
               System.Globalization.CultureInfo.CurrentCulture,;
               true,; //printUnitsInHeader
               SizeUnit.KB,;
               Perfolizer.Horology.TimeUnit.Microsecond,;
               false; //printUnitsInContent
      }})
      return

end class