/*
  Warnings:

  - You are about to drop the column `email` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `emailVerified` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Statistics` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Statistics" DROP CONSTRAINT "Statistics_userId_fkey";

-- DropIndex
DROP INDEX "User_email_key";

-- AlterTable
ALTER TABLE "Meal" ALTER COLUMN "content" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Recipe" ADD COLUMN     "imageUrl" TEXT,
ALTER COLUMN "content" SET DATA TYPE TEXT,
ALTER COLUMN "guide" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "email",
DROP COLUMN "emailVerified",
DROP COLUMN "name";

-- DropTable
DROP TABLE "Statistics";
