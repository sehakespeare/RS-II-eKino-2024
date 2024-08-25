using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eKino.Services.Migrations
{
    public partial class PromjenaTipovaPodatakaZaRezerv : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Row",
                table: "Reservations",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<string>(
                name: "Column",
                table: "Reservations",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 1,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "D6" });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 2,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "A8" });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 3,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "C2" });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 4,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "D4" });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 5,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "B6" });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 6,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "B1" });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 7,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "A5" });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 8,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "A1" });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 9,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "B3, C3, D2" });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 10,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "A4, B2, C2" });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 11,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "A1, A2, A3" });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 12,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "A4, B4" });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 13,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "A1, B3" });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 14,
                columns: new[] { "Column", "Row" },
                values: new object[] { "x", "A2, B1" });

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 1,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 2,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 3,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 4,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 5,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 6,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 7,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 8,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 9,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 10,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 11,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 12,
                column: "DateModified",
                value: new DateTime(2024, 7, 4, 0, 0, 0, 0, DateTimeKind.Local));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "Row",
                table: "Reservations",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "Column",
                table: "Reservations",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 1,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 2,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 3,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 4,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 5,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 6,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 7,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 8,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 9,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 10,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 11,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 12,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 13,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "Reservations",
                keyColumn: "ReservationId",
                keyValue: 14,
                columns: new[] { "Column", "Row" },
                values: new object[] { 1, 1 });

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 1,
                column: "DateModified",
                value: new DateTime(2024, 6, 14, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 2,
                column: "DateModified",
                value: new DateTime(2024, 6, 14, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 3,
                column: "DateModified",
                value: new DateTime(2024, 6, 14, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 4,
                column: "DateModified",
                value: new DateTime(2024, 6, 14, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 5,
                column: "DateModified",
                value: new DateTime(2024, 6, 14, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 6,
                column: "DateModified",
                value: new DateTime(2024, 6, 14, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 7,
                column: "DateModified",
                value: new DateTime(2024, 6, 14, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 8,
                column: "DateModified",
                value: new DateTime(2024, 6, 14, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 9,
                column: "DateModified",
                value: new DateTime(2024, 6, 14, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 10,
                column: "DateModified",
                value: new DateTime(2024, 6, 14, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 11,
                column: "DateModified",
                value: new DateTime(2024, 6, 14, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 12,
                column: "DateModified",
                value: new DateTime(2024, 6, 14, 0, 0, 0, 0, DateTimeKind.Local));
        }
    }
}
