using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eKino.Services.Migrations
{
    public partial class test2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Reservations",
                columns: new[] { "ReservationId", "Column", "DateOfReservation", "IsDeleted", "NumTickets", "ProjectionId", "Row", "UserId" },
                values: new object[] { 17, "x", new DateTime(2023, 11, 12, 15, 0, 0, 0, DateTimeKind.Unspecified), false, 2, 12, "A4, B3", 6 });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 17);
        }
    }
}
