using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace eKino.Services.Migrations
{
    public partial class AddProsirivanje2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "RadniStatusId",
                table: "Users",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "StepenObrazovanjaId",
                table: "Users",
                type: "int",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "RadniStatuses",
                columns: table => new
                {
                    RadniStatusId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RadniStatuses", x => x.RadniStatusId);
                });

            migrationBuilder.CreateTable(
                name: "StepenObrazovanjas",
                columns: table => new
                {
                    StepenObrazovanjaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Naziv = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StepenObrazovanjas", x => x.StepenObrazovanjaId);
                });

            migrationBuilder.InsertData(
                table: "RadniStatuses",
                columns: new[] { "RadniStatusId", "IsDeleted", "Naziv" },
                values: new object[,]
                {
                    { 1, false, "Zaposlen" },
                    { 2, false, "Nezaposlen" }
                });

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 1,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 2,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 3,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 4,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 5,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 6,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 7,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 8,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 9,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 10,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 11,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 12,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 13,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 14,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.InsertData(
                table: "StepenObrazovanjas",
                columns: new[] { "StepenObrazovanjaId", "IsDeleted", "Naziv" },
                values: new object[,]
                {
                    { 1, false, "Osnovno" },
                    { 2, false, "Srednje" },
                    { 3, false, "Bachelor (Osnovne studije)" },
                    { 4, false, "Master" },
                    { 5, false, "Doktorat" }
                });

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 1,
                column: "DateModified",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 2,
                column: "DateModified",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 3,
                column: "DateModified",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 4,
                column: "DateModified",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 5,
                column: "DateModified",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 6,
                column: "DateModified",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 7,
                column: "DateModified",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 8,
                column: "DateModified",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 9,
                column: "DateModified",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 10,
                column: "DateModified",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 11,
                column: "DateModified",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 12,
                column: "DateModified",
                value: new DateTime(2024, 12, 10, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 2,
                columns: new[] { "RadniStatusId", "StepenObrazovanjaId" },
                values: new object[] { 1, 3 });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 3,
                columns: new[] { "RadniStatusId", "StepenObrazovanjaId" },
                values: new object[] { 1, 3 });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 4,
                columns: new[] { "RadniStatusId", "StepenObrazovanjaId" },
                values: new object[] { 1, 3 });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 5,
                columns: new[] { "RadniStatusId", "StepenObrazovanjaId" },
                values: new object[] { 1, 3 });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 6,
                columns: new[] { "RadniStatusId", "StepenObrazovanjaId" },
                values: new object[] { 1, 3 });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 7,
                columns: new[] { "RadniStatusId", "StepenObrazovanjaId" },
                values: new object[] { 1, 3 });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 8,
                columns: new[] { "RadniStatusId", "StepenObrazovanjaId" },
                values: new object[] { 1, 3 });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 9,
                columns: new[] { "RadniStatusId", "StepenObrazovanjaId" },
                values: new object[] { 1, 3 });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 10,
                columns: new[] { "RadniStatusId", "StepenObrazovanjaId" },
                values: new object[] { 1, 3 });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 11,
                columns: new[] { "RadniStatusId", "StepenObrazovanjaId" },
                values: new object[] { 1, 3 });

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 12,
                columns: new[] { "RadniStatusId", "StepenObrazovanjaId" },
                values: new object[] { 1, 3 });

            migrationBuilder.CreateIndex(
                name: "IX_Users_RadniStatusId",
                table: "Users",
                column: "RadniStatusId");

            migrationBuilder.CreateIndex(
                name: "IX_Users_StepenObrazovanjaId",
                table: "Users",
                column: "StepenObrazovanjaId");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_RadniStatuses_RadniStatusId",
                table: "Users",
                column: "RadniStatusId",
                principalTable: "RadniStatuses",
                principalColumn: "RadniStatusId");

            migrationBuilder.AddForeignKey(
                name: "FK_Users_StepenObrazovanjas_StepenObrazovanjaId",
                table: "Users",
                column: "StepenObrazovanjaId",
                principalTable: "StepenObrazovanjas",
                principalColumn: "StepenObrazovanjaId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Users_RadniStatuses_RadniStatusId",
                table: "Users");

            migrationBuilder.DropForeignKey(
                name: "FK_Users_StepenObrazovanjas_StepenObrazovanjaId",
                table: "Users");

            migrationBuilder.DropTable(
                name: "RadniStatuses");

            migrationBuilder.DropTable(
                name: "StepenObrazovanjas");

            migrationBuilder.DropIndex(
                name: "IX_Users_RadniStatusId",
                table: "Users");

            migrationBuilder.DropIndex(
                name: "IX_Users_StepenObrazovanjaId",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "RadniStatusId",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "StepenObrazovanjaId",
                table: "Users");

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 1,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 2,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 3,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 4,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 5,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 6,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 7,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 8,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 9,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 10,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 11,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 12,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 13,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "Ratings",
                keyColumn: "RatingId",
                keyValue: 14,
                column: "DateOfRating",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 1,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 2,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 3,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 4,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 5,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 6,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 7,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 8,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 9,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 10,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 11,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));

            migrationBuilder.UpdateData(
                table: "UserRoles",
                keyColumn: "UserRoleId",
                keyValue: 12,
                column: "DateModified",
                value: new DateTime(2024, 12, 9, 0, 0, 0, 0, DateTimeKind.Local));
        }
    }
}
