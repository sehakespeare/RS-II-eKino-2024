using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eKino.Services.Migrations
{
    public partial class NovaMig : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 16);

            migrationBuilder.DeleteData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 17);

            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 14,
                column: "DateOfProjection",
                value: new DateTime(2024, 10, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 15,
                column: "DateOfProjection",
                value: new DateTime(2024, 10, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 14,
                column: "DateOfProjection",
                value: new DateTime(2024, 9, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.UpdateData(
                table: "Projections",
                keyColumn: "ProjectionId",
                keyValue: 15,
                column: "DateOfProjection",
                value: new DateTime(2024, 9, 15, 20, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.InsertData(
                table: "Projections",
                columns: new[] { "ProjectionId", "AuditoriumId", "DateOfProjection", "IsDeleted", "MovieId", "TicketPrice" },
                values: new object[,]
                {
                    { 16, 2, new DateTime(2024, 10, 15, 20, 0, 0, 0, DateTimeKind.Unspecified), false, 5, 10.00m },
                    { 17, 3, new DateTime(2024, 10, 18, 20, 0, 0, 0, DateTimeKind.Unspecified), false, 6, 10.00m }
                });
        }
    }
}
