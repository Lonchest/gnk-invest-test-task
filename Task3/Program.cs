namespace Task3;

/// <summary>
/// Так как какой-либо контекст у задачи отсутсвует, пришлось задать его самому.
/// Если есть какие-либо недочеты — исправлю все без проблем, но нужно расписать задачу более конкретно.
/// Мой контекст: когда поступает какая-от сумма, то происходит поиск неоплаченной или лишь частично оплаченной записи.
/// В эту запись добавляется оплаченная сумма. Так как в примере фактическая сумма 10000 так и записывается, 
/// то никакой логики при перевыполении плана, как я понял, не присутсвует.
/// Также в задании не указано нужно ли использовать базу данных или создавать подобную таблицу, 
/// поэтому все операции производятся без сохранения куда-то и без чтения записей из таблицы.
/// </summary>
public class PaymentRecord
{
    public DateTime PlanDate { get; set; }
    public decimal PlannedAmount { get; set; }
    public decimal ActualAmount { get; set; }
    public string Status { get; set; }
}

class PaymentProcessor
{
    private List<PaymentRecord> records;

    public PaymentProcessor(List<PaymentRecord> records)
    {
        this.records = records;
    }

    public void ProcessPayment(decimal payment)
    {
        if (payment < 0)
        {
            Console.WriteLine($"Сумма платежа не может быть отрицательной. Поступивший платеж: {payment}");
            return;
        }
        var record = records.FirstOrDefault(r => r.Status == "Частично оплачено" || string.IsNullOrEmpty(r.Status));
        if (record != null)
        {
            record.ActualAmount += payment;

            if (record.ActualAmount >= record.PlannedAmount)
            {
                record.Status = "Оплачено";
            }
            else
            {
                record.Status = "Частично оплачено";
            }
        }
    }

    public void PrintRecords()
    {
        foreach (var record in records)
        {
            Console.WriteLine($"{record.PlanDate:dd.MM.yyyy} | {record.PlannedAmount} | {record.ActualAmount} | {record.Status}");
        }
    }
}
internal class Program
{
    static void Main(string[] args)
    {
        var records = new List<PaymentRecord>
        {
            new PaymentRecord { PlanDate = new DateTime(2024, 1, 22), PlannedAmount = 5000, ActualAmount = 6000, Status = "Оплачено" },
            new PaymentRecord { PlanDate = new DateTime(2024, 2, 22), PlannedAmount = 5000, ActualAmount = 10000, Status = "Оплачено" },
            new PaymentRecord { PlanDate = new DateTime(2024, 3, 22), PlannedAmount = 5000, ActualAmount = 0, Status = "" },
            new PaymentRecord { PlanDate = new DateTime(2024, 4, 22), PlannedAmount = 5000, ActualAmount = 0, Status = "" },
            new PaymentRecord { PlanDate = new DateTime(2024, 5, 22), PlannedAmount = 5000, ActualAmount = 0, Status = "" },
            new PaymentRecord { PlanDate = new DateTime(2024, 6, 22), PlannedAmount = 5000, ActualAmount = 0, Status = "" }
        };
        var processor = new PaymentProcessor(records);
        processor.ProcessPayment(-2000);
        processor.ProcessPayment(4000);
        processor.PrintRecords();
    }
}
