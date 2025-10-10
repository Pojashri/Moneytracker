<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Tracker.dashboard" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Dashboard</title>
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

    <style>
        body {  background-color: #f4f6fa;   font-family: 'Poppins', sans-serif;  }
        .dashboard-container {  display: flex; min-height: 90vh; border-radius: 20px; overflow: hidden; background: #fff;  box-shadow: 0 10px 25px rgba(0,0,0,0.1);}
        .sidebar {
            width: 500px;
                background-color: #ebeef3;
            color: black;
            padding: 30px 15px;
        }

        .sidebar h3 {
            font-weight: 600;
            font-size: 20px;
            margin-bottom: 40px;
            text-align: center;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 18px 0;
        }

        .sidebar ul li a {
            color: #cbd5e1;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 500;
            transition: all .3s ease;
        }

        .sidebar ul li a:hover, .sidebar ul li a.active {
            color: #fff;
            background: #1e293b;
            border-radius: 10px;
            padding: 10px;
        }

        .main-content {
            flex-grow: 1;
            padding: 40px;
        }
        #categoryChart {
    width: 100% !important;
    height: 400px !important;
}
        .summary-card {
            background: white;
            border-radius: 20px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            max-width:500px
        }

        .summary-card h4 {
            font-weight: 600;
        }

        .expenses-list {
            margin-top: 25px;
        }

        .expense-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #eee;
        }

        .expense-item:last-child {
            border-bottom: none;
        }

        .expense-category {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 500;
        }

        .expense-category i {
            width: 35px;
            height: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            color: #fff;
        }

        .expense-category .grocery { background-color: #3b82f6; }
        .expense-category .transport { background-color: #a855f7; }
        .expense-category .housing { background-color: #f97316; }
        .expense-category .food { background-color: #ef4444; }
        .expense-category .entertainment { background-color: #22c55e; }

        .amount {
            font-weight: 600;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard-container mt-3">
        <div class="main-content">
            <h3 class="mb-4 fw-bold">Expenses Overview</h3>
            <div class="summary-card custom-class">
                <h4>Today</h4>
                <div class="expenses-list mt-3">
                    <div class="expense-item">
                        <div class="expense-category">
                            <i class="fa-solid fa-cart-shopping grocery"></i> Grocery
                        </div>
                        <div class="amount text-danger">-326.800</div>
                    </div>
                    <div class="expense-item">
                        <div class="expense-category">
                            <i class="fa-solid fa-bus transport"></i> Transportation
                        </div>
                        <div class="amount text-danger">-15.000</div>
                    </div>
                    <div class="expense-item">
                        <div class="expense-category">
                            <i class="fa-solid fa-house housing"></i> Housing
                        </div>
                        <div class="amount text-danger">-185.750</div>
                    </div>
                </div>
            </div>
        </div>
            <div class="sidebar">
            <h3>Where your money go?</h3>
            <h3>Category-wise Expenditure</h3>
              <canvas id="categoryChart"></canvas>
        </div>
      </div>

    
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2"></script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const labels = [
            "Food", "Transport", "Shopping", "Bills", "Health", "Entertainment", "Others"
        ];
        const data = [10200, 8610, 6950, 6756, 5868, 5735, 3967];

        const pastelColors = '#40E0D9';
        //[
        //    '#1E90FF', '#00BFFF', '#20B2AA', '#40E0D0', '#5F9EA0', '#48D1CC', '#87CEFA'
        //];

        new Chart(document.getElementById("categoryChart"), {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Amount (Rs)',
                    data: data,
                    backgroundColor: labels.map((_, i) => pastelColors[i % pastelColors.length]),
                    borderRadius: 6,
                    barThickness: 12
                }]
            },
            options: {
                indexAxis: 'y',
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false },
                    datalabels: {
                        anchor: 'end',
                        align: 'right',
                        formatter: v => v.toLocaleString(),
                        color: '#000',
                        font: { size: 13, weight: 'bold' }
                    }
                },
                layout: {
                    padding: { left: 0, right: 20, top: 10, bottom: 10 }
                },
                scales: {
                    x: {
                        beginAtZero: true,
                        grid: { display: false },
                        ticks: { display: false }
                    },
                    y: {
                        grid: { display: false },
                        ticks: { color: '#111', font: { size: 13, weight: '500' } },
                        barPercentage: 0.7,      // control thickness
                        categoryPercentage: 0.7   // control spacing between bars
                    }
                }
            },
            plugins: [ChartDataLabels]
        });


    });
</script>

<style>
.sidebar {
  width: 500px;
  background-color: #f9f9f9;
  padding: 25px 20px;
  font-family: 'Segoe UI', sans-serif;
}
#categoryChart {
  height: 300px !important;
}
.sidebar h3 {
  margin-bottom: 15px;
  font-weight: 600;
  color: #222;
}
</style>


   <%-- <script>
        document.addEventListener("DOMContentLoaded", function () {
            $.ajax({
                type: "POST", // must be POST for [WebMethod]
                url: "/UI/dashboard.aspx/Getdashboardkpis",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const data = response.d; // WebForms returns inside "d"
                    if (!data || data.length === 0) return;

                    const labels = data.map(x => x.name);
                    const values = data.map(x => x.totalprice);

                    const pastelColors = [
                        '#16a085', '#27ae60', '#2980b9', '#8e44ad', '#f39c12', '#d35400', '#c0392b'
                    ];

                    new Chart(document.getElementById("categoryChart"), {
                        type: 'bar',
                        data: {
                            labels: labels,
                            datasets: [{
                                label: 'Amount (Rs)',
                                data: data,
                                backgroundColor: labels.map((_, i) => pastelColors[i % pastelColors.length]),
                                borderRadius: 6,
                                barThickness: 12
                            }]
                        },
                        options: {
                            indexAxis: 'y',
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: { display: false },
                                datalabels: {
                                    anchor: 'end',
                                    align: 'right',
                                    formatter: v => v.toLocaleString(),
                                    color: '#000',
                                    font: { size: 13, weight: 'bold' }
                                }
                            },
                            layout: {
                                padding: { left: 0, right: 20, top: 10, bottom: 10 }
                            },
                            scales: {
                                x: {
                                    beginAtZero: true,
                                    grid: { display: false },
                                    ticks: { display: false }
                                },
                                y: {
                                    grid: { display: false },
                                    ticks: { color: '#111', font: { size: 13, weight: '500' } },
                                    barPercentage: 0.7,      // control thickness
                                    categoryPercentage: 0.7   // control spacing between bars
                                }
                            }
                        },
                        plugins: [ChartDataLabels]
                    });
                },
                error: function (xhr) {
                    console.error("Error fetching chart data:", xhr.responseText);
                }
            });
        });
    </script>--%>












</asp:Content>



